import 'package:flutter/material.dart';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';

import 'camera_image.dart'; // archivo con inputImageFromCameraImage()

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barcode Scanner',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BarcodeScannerCameraScreen(cameras: cameras),
    );
  }
}

class BarcodeScannerCameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const BarcodeScannerCameraScreen({super.key, required this.cameras});

  @override
  State<BarcodeScannerCameraScreen> createState() =>
      _BarcodeScannerCameraScreenState();
}

class _BarcodeScannerCameraScreenState
    extends State<BarcodeScannerCameraScreen> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;

  final BarcodeScanner _barcodeScanner = BarcodeScanner();

  String _recognizedText = '';
  bool _isBusy = false;

  @override
  void initState() {
    super.initState();
    _loadCameraController();
  }

  void _loadCameraController() {
    _cameraController = CameraController(
      widget.cameras[0],
      ResolutionPreset.max,
      imageFormatGroup:
          Platform.isIOS ? ImageFormatGroup.bgra8888 : ImageFormatGroup.nv21,
    );
    _initializeControllerFuture = _cameraController.initialize().then((_) {
      if (!mounted) return;
      _cameraController.startImageStream(_processImage);
    });
  }

  void _processImage(CameraImage image) async {
    if (_isBusy) return;

    _isBusy = true;
    final inputImage = inputImageFromCameraImage(
      image,
      widget.cameras,
      0,
      _cameraController,
    );
    if (inputImage == null) {
      _isBusy = false;
      return;
    }

    try {
      final List<Barcode> barcodes =
          await _barcodeScanner.processImage(inputImage);

      String result = '';
      for (final barcode in barcodes) {
        result += 'Código: ${barcode.rawValue}\n';
      }

      setState(() {
        _recognizedText = result.isEmpty ? 'Sin código' : result;
        _isBusy = false;
      });
    } catch (e) {
      print('Error escaneando: $e');
      _isBusy = false;
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _barcodeScanner.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Escáner de Códigos")),
      body: Column(
        children: <Widget>[
          Expanded(
            child: FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      CameraPreview(_cameraController),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.black.withAlpha(100),
                          child: Text(
                            _recognizedText,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}