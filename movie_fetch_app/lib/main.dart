import 'package:flutter/material.dart';
import './view/show_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Búsqueda de Serie'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _busquedaController = TextEditingController();

  void _buscarSerie() {
    if (_formKey.currentState!.validate()) {
      String busqueda = _busquedaController.text.trim();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ShowList(busqueda: busqueda),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'tvmaze.com',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _busquedaController,
                decoration: const InputDecoration(
                  labelText: "Ingrese su búsqueda",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Por favor, ingrese búsqueda';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _buscarSerie,
              child: const Text("Buscar"),
            ),
          ],
        ),
      ),
    );
  }
}

