//Edwin Argueta 32111584
//Darwin Espinal 32141286

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:modal_perfil/perfil.dart';

void main() {
  runApp(const MyApp());
}

// Clase 1
// inicia la app con stateless
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Mis Canciones'),
    );
  }
}

// Clase 2
// ahora inicia stateless
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//Clase 3
//aqui es el estado de la aplicacion , ejemplo hay una variable  y hara lo que se definio
class _MyHomePageState extends State<MyHomePage> {
  List<Alumno> alumnos = [];

  @override
  initState() {
    super.initState();
    alumnos.add(Alumno(
      nombre: 'Viva la vida',
      album: "viva",
      fechalanzamiento: "2008",
      artista: "Coldplay",
      genero: "Pop",
      imagen:
          'https://upload.wikimedia.org/wikipedia/en/b/b2/Coldplay_-_Viva_la_Vida_or_Death_and_All_His_Friends.png',
    ));

    alumnos.add(Alumno(
    nombre: 'Requiem',
    album: "Misa de difuntos",
    fechalanzamiento: "1791",
    artista: "Mozart",
    genero: "Romanticismo musical",
    imagen:
        'https://i.scdn.co/image/ab67616d0000b273427f1be77427bf1c4b292b2d',
    ));

    alumnos.add(Alumno(
    nombre: 'Karma Chameleon',
    album: "Colour by Numbers",
    fechalanzamiento: "1983",
    artista: "Culture Club",
    genero: "Pop, Rock",
    imagen:
        'https://upload.wikimedia.org/wikipedia/en/a/a8/Nw171.jpg',
    ));

    alumnos.add(Alumno(
    nombre: 'Beat It',
    album: "Michael Jackson: esto es todo",
    fechalanzamiento: "1982",
    artista: "Michael Jackson",
    genero: "Dance-rock, Disco, Dance pop",
    imagen:
        'https://i1.sndcdn.com/artworks-000329038545-d554xk-t500x500.jpg',
    ));

    alumnos.add(Alumno(
    nombre: 'Mi burrito sabanero',
    album: "Mi Burrito Sabanero Remix",
    fechalanzamiento: "2010",
    artista: "Canticuentos",
    genero: "Villancico",
    imagen:
        'https://i.scdn.co/image/ab67616d0000b27360169a12e580932d89d99c8f',
    ));

    alumnos.add(Alumno(
    nombre: 'Viva la vida',
    album: "viva",
    fechalanzamiento: "2008",
    artista: "Coldplay",
    genero: "Pop",
    imagen:
        'https://upload.wikimedia.org/wikipedia/en/b/b2/Coldplay_-_Viva_la_Vida_or_Death_and_All_His_Friends.png',
    ));

    alumnos.add(Alumno(
    nombre: 'Bring me to life',
    album: "Fallen",
    fechalanzamiento: "2003",
    artista: "Evanescence",
    genero: "Hard rock, Metal gótico",
    imagen:
        'https://i.scdn.co/image/ab67616d0000b27325f49ab23f0ec6332efef432',
    ));

        alumnos.add(Alumno(
    nombre: 'Claro de Luna',
    album: "Opus 27, n.º 2",
    fechalanzamiento: "1801",
    artista: "Beethoven",
    genero: "Romanticismo",
    imagen:
        'https://static-1.ivoox.com/audios/6/4/2/5/5341466415246_LG.jpg',
    ));

    alumnos.add(Alumno(
    nombre: 'Bohemian Rhapsody',
    album: "A Night at the Opera",
    fechalanzamiento: "2003",
    artista: "Queen",
    genero: "Hard rock, Pop progresivo",
    imagen:
        'https://www.queenonline.com/global/uploads/NATO-7-010.jpg',
    ));



  }

  ////////////////////////// crear un widget
    Widget setupAlertDialoadContainer(Alumno alumno) {
      return Column(
        children: [

          // Text("texto"),
          // ClipOval(child: CachedNetworkImage(imageUrl: 'https://upload.wikimedia.org/wikipedia/en/b/b2/Coldplay_-_Viva_la_Vida_or_Death_and_All_His_Friends.png'),),
          // Text("otro textp")

          Text(alumno.nombre),
          ClipOval(child: CachedNetworkImage(imageUrl: alumno.imagen),),
          Text(alumno.artista)
        ],
      );
    }


  /////////////////

  // este es un widget creado
  Widget getAlumno(Alumno alumno) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  imageUrl: alumno.imagen,
                  width: 70.0,
                  height: 70.0,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    alumno.nombre,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(alumno.artista),
                ],
              ),
            ],
          ),
      

          /// ojito
          GestureDetector(
            child: const Icon(Icons.remove_red_eye),
            onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        '  ',
                        textAlign: TextAlign.center,
                      ),
                      content: setupAlertDialoadContainer(alumno),
                    );
                  });
            },
          ),
           GestureDetector(
            child: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Perfil(alumno: alumno)));
            },
          )
        ]),
      ),
    );
  }

  // esta es la app ya corriendo normal pero de manera de OOP--- mapea
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: alumnos.length,
            itemBuilder: (BuildContext context, int index) {
              Alumno temp = alumnos[index];
              return getAlumno(temp);
            }
        )
            
    );
  }
}

// la clase de tipo alumno
class Alumno {
  String nombre;
  String album;
  String fechalanzamiento;
  String artista;
  String genero;
  String imagen;

  // List<String> clases;

  Alumno(
      {required this.nombre,
      required this.album,
      required this.fechalanzamiento,
      required this.artista,
      required this.genero,
      required this.imagen});
}
