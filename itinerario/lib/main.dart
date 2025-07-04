import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tarea2/perfil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Mi Itinerario',
      home: MyHomePage(title: 'Mi Itinerario'),
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
  List<Pais> paises = [];

  @override
  void initState() {
    super.initState();

    paises.add(Pais(
        nombrePais: 'Francia',
        imagen:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/D%C3%A9partements%2Br%C3%A9gions_%28France%29-2016.svg/1024px-D%C3%A9partements%2Br%C3%A9gions_%28France%29-2016.svg.png',
        historia:
            'Francia, conocida por su rica historia y cultura, es famosa por monumentos como la Torre Eiffel, el Museo del Louvre y su patrimonio culinario.',
        atracciones: [
          'Torre Eiffel',
          'Museo del Louvre',
          'Palacio de Versalles',
          'Catedral de Notre-Dame de París',
          'Mont Saint-Michel',
          'Castillos del Valle del Loira',
          'Catedral de Chartres',
          'El Arco del Triunfo',
          'Palacio de los Papas',
          'La Costa Azul (Riviera Francesa)',
          'La Provenza',
          'La Isla de Córcega',
          'Los Campos Elíseos',
          'El Museo de Orsay',
          'El Panteón',
          'Los Alpes franceses',
          'La Duna de Pilat',
          'Château de Chambord',
          'Cueva de Lascaux',
          'Puy du Fou',
        ],
        riosMares: [
          'Río Sena',
          'Río Loira',
          'Río Ródano',
          'Mar del Norte',
          'Canal de la Mancha',
          'Mar Mediterráneo'
        ],
        infraestructura:
            'Francia cuenta con una infraestructura de transporte avanzada, incluyendo trenes de alta velocidad (TGV) y una extensa red de carreteras.',
        clima: [
          "variable",
          "Clima variado, con veranos cálidos y secos en el sur, y lluvioso y templado en el norte."
        ],
        gastronomia:
            'Alta cocina, vinos, quesos, panadería, repostería y platos icónicos como coq au vin y boeuf bourguignon'));

    paises.add(Pais(
        nombrePais: 'Italia',
        imagen:
            'https://upload.wikimedia.org/wikipedia/commons/7/76/Italie-carte.png',
        historia:
            'Italia es la cuna del Renacimiento y es famosa por su arte, cultura, gastronomía y paisajes históricos. Desde las antiguas ruinas del Coliseo hasta la modernidad de sus ciudades, Italia ofrece una experiencia única que combina historia.',
        atracciones: [
          'Coliseo Romano',
          'Torre de Pisa',
          'Canales de Venecia',
          'Ciudad del Vaticano y Basílica de San Pedro',
          'Fontana di Trevi',
          'Duomo de Milán',
          'Galería Uffizi (Florencia)',
          'Pompeya y el Vesubio',
          'Plaza Navona (Roma)',
          'Piazza del Campo (Siena)',
          'Catedral de Florencia'
        ],
        riosMares: [
          'Río Po',
          'Río Tíber',
          'Río Arno',
          'Mar Adriático',
          'Mar Jónico',
          'Mar Tirreno',
          'Mar Mediterráneo'
        ],
        infraestructura:
            'Italia cuenta con una infraestructura turística bien desarrollada, que incluye una extensa red ferroviaria (como el Frecciarossa), modernas autopistas y aeropuertos internacionales, facilitando el acceso a sus numerosos sitios históricos y culturales.',
        clima: [
          "soleado",
          "Generalmente cálido y mediterráneo, con veranos calurosos y suaves inviernos, especialmente en el sur."
        ],
        gastronomia:
            'Pasta, pizza, risotto, lasaña, carpaccio, tiramisú, gelato y una gran variedad de vinos y quesos'));

    paises.add(Pais(
        nombrePais: 'España',
        imagen:
            'https://upload.wikimedia.org/wikipedia/commons/c/c1/Sp-map-es.png',
        historia:
            'España es conocida por su diversidad cultural y arquitectónica, con sitios como la Alhambra y la Sagrada Familia.',
        atracciones: [
          'Alhambra',
          'Sagrada Familia',
          'Plaza Mayor',
          'Parque Güell',
          'Museo del Prado',
          'Palacio Real de Madrid',
          'La Rambla',
          'Catedral de Santiago de Compostela',
          'El Escorial',
          'Costa Brava',
          'Islas Baleares',
          'La Costa del Sol'
        ],
        riosMares: [
          'Río Ebro',
          'Río Guadalquivir',
          'Río Duero',
          'Mar Cantábrico',
          'Mar Mediterráneo',
          'Golfo de Cádiz'
        ],
        infraestructura:
            'España dispone de una excelente infraestructura turística, con una amplia red de trenes de alta velocidad (AVE), aeropuertos internacionales y una gran oferta hotelera y gastronómica.',
        clima: [
          "soleado",
          "Clima mediterráneo en la costa, con veranos calurosos y secos, y clima continental en el interior con inviernos fríos."
        ],
        gastronomia:
            'Tapas, paella, jamón ibérico, tortilla española, gazpacho, fabada asturiana y una gran variedad de vinos y mariscos'));

    paises.add(Pais(
        nombrePais: 'Estados Unidos',
        imagen:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Map_of_USA_with_state_names_es.svg/1200px-Map_of_USA_with_state_names_es.svg.png',
        historia:
            'Estados Unidos ofrece una variedad de paisajes y culturas, desde las playas de California hasta la ciudad de Nueva York.',
        atracciones: [
          'Gran Cañón',
          'Estatua de la Libertad',
          'Parques Nacionales',
          'La Casa Blanca',
          'Las Cataratas del Niágara',
          'Parque Nacional de Yellowstone',
          'Las Vegas Strip',
          'Disneyland',
          'Monumento a Lincoln',
          'Times Square'
        ],
        riosMares: [
          'Río Mississippi',
          'Río Colorado',
          'Río Missouri',
          'Océano Atlántico',
          'Océano Pacífico',
          'Golfo de México'
        ],
        infraestructura:
            'Estados Unidos cuenta con una infraestructura moderna, con una extensa red de carreteras, aeropuertos internacionales y sistemas de transporte público en sus principales ciudades.',
        clima: [
          "variable",
          "Clima diverso, desde tropical en Florida hasta frío en Alaska, pasando por templado en la mayoría de ciudades."
        ],
        gastronomia:
            'Hamburguesas, hot dogs, barbecue, mac and cheese, fried chicken, apple pie y una fusión de cocinas internacionales'));

    paises.add(Pais(
        nombrePais: 'México',
        imagen:
            'https://upload.wikimedia.org/wikipedia/commons/7/7f/Mexico_watersheds.jpg',
        historia:
            'México es rico en historia y cultura, con sitios arqueológicos como Chichén Itzá y playas como Cancún.',
        atracciones: [
          'Chichén Itzá',
          'Playa de Cancún',
          'Zócalo de Ciudad de México',
          'Teotihuacán',
          'Xcaret',
          'Palacio de Bellas Artes',
          'La Riviera Maya',
          'Cenotes de Yucatán',
          'Tulum',
          'Catedral Metropolitana de la Ciudad de México'
        ],
        riosMares: [
          'Río Bravo',
          'Río Usumacinta',
          'Mar de Cortés',
          'Golfo de México',
          'Océano Pacífico'
        ],
        infraestructura:
            'México ofrece una infraestructura turística en crecimiento, con una variedad de alojamientos, resorts, y servicios para los turistas, especialmente en la Riviera Maya y Cancún.',
        clima: [
          "soleado",
          "Clima tropical y cálido en las costas, y más templado o frío en las zonas montañosas."
        ],
        gastronomia:
            'Tacos, tamales, mole, chiles en nogada, pozole, enchiladas y una gran variedad de antojitos y salsas picantes'));

    paises.add(Pais(
        nombrePais: 'Japón',
        imagen:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Japan_%28%2BKuril_Islands_hatched%29%2C_administrative_divisions_-_es_-_colored.svg/320px-Japan_%28%2BKuril_Islands_hatched%29%2C_administrative_divisions_-_es_-_colored.svg.png',
        historia:
            'Japón combina tradición y modernidad, con templos antiguos y ciudades futuristas como Tokio.',
        atracciones: [
          'Templo Kinkaku-ji',
          'Monte Fuji',
          'Shibuya Crossing',
          'Templo Senso-ji',
          'Palacio Imperial de Tokio',
          'Torre de Tokio',
          'Akihabara',
          'Himeji Castle',
          'Isla de Miyajima',
          'Parque Nara'
        ],
        riosMares: [
          'Río Shinano',
          'Río Tone',
          'Río Kiso',
          'Mar de Japón',
          'Océano Pacífico'
        ],
        infraestructura:
            'Japón cuenta con una infraestructura de transporte eficiente, incluyendo trenes bala, autobuses y una extensa red de metro en Tokio y Osaka.',
        clima: [
          "templado",
          "Clima templado con estaciones marcadas, veranos cálidos y húmedos, y fríos inviernos, especialmente en el norte."
        ],
        gastronomia:
            'Sushi, sashimi, ramen, tempura, teriyaki, okonomiyaki, takoyaki y una variedad de platos a base de arroz y pescado'));

    paises.add(Pais(
        nombrePais: 'Australia',
        imagen:
            'https://upload.wikimedia.org/wikipedia/commons/c/cc/Australia_satellite_states.jpg',
        historia:
            'Australia es conocida por su biodiversidad única y paisajes naturales como la Gran Barrera de Coral.',
        atracciones: [
          'Gran Barrera de Coral',
          'Ópera de Sídney',
          'Uluru',
          'Islas Whitsunday',
          'Parque Nacional Kakadu',
          'La Gran Carretera Oceánica',
          'Cataratas de Litchfield',
          'Monumento Nacional de Australia',
          'Puerto Darling',
          'Playa Bondi'
        ],
        riosMares: [
          'Río Murray',
          'Río Darling',
          'Océano Pacífico',
          'Océano Índico'
        ],
        infraestructura:
            'Australia ofrece una infraestructura turística de alta calidad, con una amplia gama de actividades al aire libre y resorts de lujo.',
        clima: [
          "soleado",
          "Clima cálido y árido en la mayor parte del país, con veranos calurosos y secos y clima subtropical en la costa este."
        ],
        gastronomia:
            'Vegemite, meat pies, pavlova, lamingtons, barramundi, kangaroo meat, y una mezcla de influencias británicas, asiáticas y mediterráneas'));

    paises.add(Pais(
        nombrePais: 'Reino Unido',
        imagen:
            'https://upload.wikimedia.org/wikipedia/commons/b/b5/Uk-map-es.png',
        historia:
            'El Reino Unido tiene una rica historia y cultura, con monumentos como el Big Ben y el Palacio de Buckingham.',
        atracciones: [
          'Big Ben',
          'Palacio de Buckingham',
          'Stonehenge',
          'Museo Británico',
          'Torre de Londres',
          'Puente de la Torre',
          'London Eye',
          'Castillo de Windsor',
          'Catedral de Canterbury',
          'El Museo de Historia Natural de Londres'
        ],
        riosMares: [
          'Río Támesis',
          'Río Severn',
          'Mar del Norte',
          'Canal de la Mancha',
          'Océano Atlántico'
        ],
        infraestructura:
            'El Reino Unido dispone de una infraestructura turística bien desarrollada, con una amplia oferta de museos, teatros, restaurantes y una red de transporte eficiente.',
        clima: [
          "nublado",
          "Clima templado y lluvioso, con inviernos fríos y húmedos, y veranos suaves."
        ],
        gastronomia:
            'Fish and chips, roast beef, shepherd\'s pie, bangers and mash, full English breakfast, scones y una variedad de postres como el sticky toffee pudding'));

    paises.add(Pais(
        nombrePais: 'Canadá',
        imagen:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Canada_political_map_-_en.svg/320px-Canada_political_map_-_en.svg.png',
        historia:
            'Canadá es conocido por sus paisajes naturales impresionantes, como las Cataratas del Niágara y las Montañas Rocosas.',
        atracciones: [
          'Cataratas del Niágara',
          'Parque Nacional Banff',
          'Ciudad de Quebec',
          'Montañas Rocosas',
          'Lago Louise',
          'Museo de Historia Canadiense',
          'Old Montreal',
          'Parque Nacional Jasper',
          'Cabo Breton',
          'Isla de Vancouver'
        ],
        riosMares: [
          'Río San Lorenzo',
          'Río Fraser',
          'Océano Atlántico',
          'Océano Pacífico',
          'Mar de Beaufort'
        ],
        infraestructura:
            'Canadá ofrece una infraestructura turística de alta calidad, con una amplia gama de actividades al aire libre y ciudades cosmopolitas como Vancouver, Montreal y Toronto.',
        clima: [
          "frío",
          "Clima mayormente frío, con inviernos largos y fríos, y veranos cortos y cálidos, especialmente en el sur."
        ],
        gastronomia:
            'Poutine, butter tarts, maple syrup, tourtière, smoked salmon, y una mezcla de influencias francesas, británicas y autóctonas'));

    paises.add(Pais(
        nombrePais: 'Tailandia',
        imagen:
            'https://upload.wikimedia.org/wikipedia/commons/b/b8/Thailand_map_CIA.png',
        historia:
            'Tailandia es famosa por sus templos budistas, playas paradisíacas y una vibrante vida nocturna.',
        atracciones: [
          'Templo del Buda Esmeralda',
          'Islas Phi Phi',
          'Mercado flotante de Damnoen Saduak',
          'Gran Palacio de Bangkok',
          'Wat Arun',
          'Playa de Patong',
          'Parque Nacional Erawan',
          'Ciudad Antigua de Ayutthaya',
          'Mercado Chatuchak',
          'Templo Wat Phra That Doi Suthep'
        ],
        riosMares: [
          'Río Chao Phraya',
          'Río Mekong',
          'Golfo de Tailandia',
          'Mar de Andamán'
        ],
        infraestructura:
            'Tailandia ofrece una infraestructura turística en crecimiento, con una variedad de alojamientos, restaurantes y actividades para los turistas.',
        clima: [
          "tropical",
          "Clima tropical, con monzones en la temporada de lluvias (mayo a octubre) y clima caluroso y seco de noviembre a febrero."
        ],
        gastronomia:
            'Pad Thai, curry tailandés, Tom Yum, satay, mango con sticky rice, sopa de coco, y una variedad de platos picantes y aromáticos'));

    paises.add(Pais(
        nombrePais: 'Egipto',
        imagen:
            'https://upload.wikimedia.org/wikipedia/commons/8/83/Egypt-region-map-cities-2.gif',
        historia:
            'Egipto es el hogar de las antiguas pirámides y el río Nilo, ofreciendo una rica historia y cultura.',
        atracciones: [
          'Pirámides de Giza',
          'Templo de Karnak',
          'Museo Egipcio de El Cairo',
          'Valle de los Reyes',
          'Abu Simbel',
          'La Gran Esfinge',
          'Mezquita de Muhammad Ali',
          'El Museo de Antigüedades de El Cairo',
          'Templo de Hatshepsut',
          'Mar Rojo'
        ],
        riosMares: ['Río Nilo', 'Mar Rojo', 'Mediterráneo'],
        infraestructura:
            'Egipto cuenta con una infraestructura turística en desarrollo, con una variedad de tours y actividades históricas, además de servicios turísticos mejorados en lugares clave.',
        clima: [
          "soleado",
          "Clima árido y desértico, con veranos extremadamente calurosos y secos, e inviernos suaves y secos."
        ],
        gastronomia:
            'Koshari, falafel, shawarma, molokhia, tahini, mahshi, y una variedad de platos a base de pan, arroz, legumbres y especias'));
  }

  Widget setupAlertDialoadContainer(Pais pais) {
    return SizedBox(
        width: double
            .maxFinite, // double. maxFinite es una constante que se usa en Flutter para definir que la altura o anchura de un widget será el máximo que permita su widget padre.
        child: ListView(
          children: [
            Column(
              children: [
                Text(
                  pais.nombrePais,
                  style: const TextStyle(fontSize: 30),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(pais.imagen),
                  radius: 150,
                ),

                // Richtext : he RichText widget displays text that uses multiple different styles/ es un widget para mostrar textoo de diiferente estiilo
                // Textspan: which is used to describe the text in a paragraph. es usadoo para describir texto del parrafo / Fuente: https://api.flutter.dev/flutter/widgets/RichText-class.html
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Historia :',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: pais.historia,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0))),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Infraestructura :',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: pais.infraestructura,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0))),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }

  Widget getPais(Pais pais) {
    int totalRiosMares = pais.riosMares.length;
    int totalAtracdciones = pais.atracciones.length;

    return Card(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(pais.nombrePais,
                    style: const TextStyle(
                        fontStyle: FontStyle.italic, fontSize: 20)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CachedNetworkImage(
                      width: 100,
                      imageUrl: pais.imagen,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                        child: Text(pais
                            .historia)) // Explicacion  :A widget that expands a child of a Row, Column, or Flex so that the child fills the available space./ Un widget que expande un elemento secundario de una fila o columna para que el elemento secundario llene el espacio disponible. (referencia https://api.flutter.dev/flutter/widgets/Expanded-class.html)
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.hiking,
                          color: Colors.brown,
                          size: 24.0,
                        ),
                        Text(totalAtracdciones.toString())
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.water,
                          color: Colors.blue,
                          size: 24.0,
                        ),
                        Text(totalRiosMares.toString())
                      ],
                    ),
                    GestureDetector(
                      child: const Icon(
                        Icons.remove_red_eye,
                        color: Colors.black,
                        size: 24.0,
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: setupAlertDialoadContainer(pais),
                              );
                            });
                      },
                    ),
                    GestureDetector(
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.blueGrey,
                        size: 24.0,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Perfil(pais: pais)));
                      },
                    )
                  ],
                )
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(35, 72, 106, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(59, 103, 144, 1),
          title: Center(
            child: Text(
              widget.title,
              style: const TextStyle(
                  fontSize: 24, color: Color.fromRGBO(239, 176, 54, 1)),
            ),
          ),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: paises.length,
            itemBuilder: (BuildContext context, int index) {
              Pais temp = paises[index];
              return getPais(temp);
            }));
  }
}

// Clases

class Pais {
  String nombrePais;
  String imagen;
  String historia;
  List<String> atracciones;
  List<String> riosMares;
  String infraestructura;
  List<String> clima;
  String gastronomia;

  Pais(
      {required this.nombrePais,
      required this.imagen,
      required this.historia,
      required this.atracciones,
      required this.riosMares,
      required this.infraestructura,
      required this.clima,
      required this.gastronomia
      });
}
