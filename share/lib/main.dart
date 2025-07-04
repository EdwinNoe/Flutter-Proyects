import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatefulWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  DemoAppState createState() => DemoAppState();
}

class DemoAppState extends State<DemoApp> {
  String text = '';
  String subject = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share Plus Plugin Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Share Plus Plugin Demo'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Texto',
                  hintText: 'Ingresa el texto o link para compartir',
                ),
                onChanged: (String value) => setState(() {
                  text = value;
                }),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Asunto',
                  hintText: 'Ingresa el asunto para compartir (optional)',
                ),
                onChanged: (String value) => setState(() {
                  subject = value;
                }),
              ),
              const SizedBox(height: 32),
              Builder(
                builder: (BuildContext context) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: text.isEmpty ? null : () => _onShare(context),
                    child: const Text('Compartir'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onShare(BuildContext context) async {
    await Share.share(
      text,
      subject: subject,
    );
  }
}
