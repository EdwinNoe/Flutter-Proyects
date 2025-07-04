import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:modal_perfil/main.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key, required this.alumno});

  final Alumno alumno;

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  Widget setupAlertDialoadContainer(List<String> clases) {
    return SizedBox(
      height: 300.0,
      width: 300.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: clases.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                clases[index],
                style: const TextStyle(fontSize: 20),
              ));
        },
      ),
    );
  }

  Widget getInfo(String etiqueta, String valor, Color color) {
    return Column(
      children: [
        Text(
          etiqueta,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        GestureDetector(
          onTap: () {
            if (etiqueta == 'Clases') {
              // showDialog(
              //     context: context,
              //     builder: (BuildContext context) {
              //       return AlertDialog(
              //         title: const Text(
              //           'Lista de Clases',
              //           textAlign: TextAlign.center,
              //         ),
              //         content: setupAlertDialoadContainer(widget.alumno.clases),
              //       );
              //     });
            }
          },
          child: Text(
            valor,
            style: TextStyle(fontSize: 18, color: color),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.alumno.nombre),
            centerTitle: true,
            leading: GestureDetector(
              child: const Icon(Icons.arrow_back_ios),
              onTap: () {
                Navigator.pop(context);
              },
            )),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: widget.alumno.imagen,
                            width: 150.0,
                            height: 150.0,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Edad: ${widget.alumno.fechalanzamiento}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  getInfo('Artista', widget.alumno.artista, const Color.fromARGB(255, 60, 174, 227)),
                  const SizedBox(
                    height: 30,
                  ),
                  getInfo('Album', widget.alumno.nombre, Colors.black),
                  const SizedBox(
                    height: 30,
                  ),
                  getInfo('Fecha de Lanzamiento', widget.alumno.fechalanzamiento,
                      const Color.fromARGB(255, 0, 0, 0))
                      ,

                  const SizedBox(
                    height: 30,
                  ),

                  getInfo('Genero', widget.alumno.genero, Colors.black),
                    const SizedBox(
                      height: 30,
                  ),
                ],
              )),
        ));
  }
}
