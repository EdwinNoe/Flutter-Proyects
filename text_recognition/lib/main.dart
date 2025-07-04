import 'package:flutter/material.dart';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import 'camera_image.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  List<CameraDescription> cameras = [];
  MyApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: TextRecognitionCameraScreen(cameras: cameras),
    );
  }
}

class TextRecognitionCameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  TextRecognitionCameraScreen({super.key, required this.cameras});

  @override
  State<TextRecognitionCameraScreen> createState() =>
      _TextRecognitionCameraScreenState();
}

class _TextRecognitionCameraScreenState
    extends State<TextRecognitionCameraScreen> {
  late CameraController _cameraController;

  late Future<void> _initializeControllerFuture;
  final TextRecognizer _textRecognizer = TextRecognizer(
    script: TextRecognitionScript.latin,
  );

  String _recognizedText = '';
  bool _isBusy = false;

  @override
  void initState() {
    // TODO: implement initState
    _loadCameraController();
    super.initState();
  }

  void _loadCameraController() async {
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
    if (inputImage == null) return;
    try {
      final RecognizedText recognizedText = await _textRecognizer.processImage(
        inputImage,
      );
      setState(() {
        _isBusy = false;
        _recognizedText = recognizedText.text;
      });
    } catch (e) {
      print('Error trying to run model $e');
    } 
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _textRecognizer.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("text Recognition Camera ")),
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
                          padding: EdgeInsets.all(8),
                          color: Colors.black.withAlpha(100),
                          child: Text(
                            _recognizedText,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
