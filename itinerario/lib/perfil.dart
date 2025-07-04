import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tarea2/main.dart';
import 'package:weather_icons/weather_icons.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key, required this.pais});

  final Pais pais;

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  // instale la dependencia weathericons para poder obtener mas iiconos relaconados con el clima y tambien hice una funcion que retorne un icon dependiiendo del argumento referencia : https://pub.dev/packages/weather_icons

  IconData getClima(String clima) {
    switch (clima) {
      case "variable":
        return WeatherIcons.cloud_refresh;
      case "soleado":
        return WeatherIcons.day_sunny;
      case "templado":
        return WeatherIcons.day_cloudy;
      case "nublado":
        return WeatherIcons.cloud;
      case "frío":
        return WeatherIcons.snowflake_cold;
      case "tropical":
        return WeatherIcons.hot;
      default:
        return Icons.help_outline;
    }
  }

  // ignore: non_constant_identifier_names
  Widget setupAlertDialoadContainer(List<String> Lista) {
    return SizedBox(
      height: 300.0,
      width: 300.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: Lista.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "• ${Lista[index]}",
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
            if (etiqueta == 'Atracciones') {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Lista de Atracciones',
                        textAlign: TextAlign.center,
                      ),
                      content:
                          setupAlertDialoadContainer(widget.pais.atracciones),
                    );
                  });
            } else if (etiqueta == 'Rios y Mares') {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Lista de Rios y Mares',
                        textAlign: TextAlign.center,
                      ),
                      content:
                          setupAlertDialoadContainer(widget.pais.riosMares),
                    );
                  });
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
        backgroundColor: const Color.fromRGBO(35, 72, 106, 1),
        appBar: AppBar(
            backgroundColor: const Color.fromRGBO(59, 103, 144, 1),
            title: Text(
              widget.pais.nombrePais,
              style: const TextStyle(
                  fontSize: 24, color: Color.fromRGBO(239, 176, 54, 1)),
            ),
            centerTitle: true,
            leading: GestureDetector(
              child: const Icon(Icons.arrow_back_ios),
              onTap: () {
                Navigator.pop(context);
              },
            )),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      BoxedIcon(
                        getClima(widget.pais.clima.first),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ), //Create a consistent Icon for WeatherIcons. (es codigo de la liibreria), https://pub.dev/documentation/weather_icons/latest/weather_icons/BoxedIcon-class.html
                      const SizedBox(width: 10),
                    ],
                  ),
                  Card(
                    color: const Color.fromARGB(254, 255, 255, 255),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: widget.pais.imagen,
                            width: 150.0,
                            height: 150.0,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          getInfo(
                              "Nombre", widget.pais.nombrePais, Colors.black),
                          const SizedBox(
                            height: 10,
                          ),
                          getInfo(
                              "Historia", widget.pais.historia, Colors.black),
                          const SizedBox(
                            height: 10,
                          ),
                          getInfo(
                              "clima", widget.pais.clima.last, Colors.black),
                          const SizedBox(
                            height: 10,
                          ),
                          getInfo("Infraestructura",
                              widget.pais.infraestructura, Colors.black),
                          const SizedBox(
                            height: 10,
                          ),

                          getInfo("Gastronomia",
                              widget.pais.gastronomia, Colors.black),
                          const SizedBox(
                            height: 10,
                          ),

                          getInfo(
                              "Atracciones",
                              widget.pais.atracciones.length.toString(),
                              const Color.fromARGB(255, 112, 47, 9)),
                          const SizedBox(
                            height: 10,
                          ),
                          getInfo(
                              "Rios y Mares",
                              widget.pais.riosMares.length.toString(),
                              const Color.fromARGB(255, 0, 140, 255)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              )),
        ));
  }
}
