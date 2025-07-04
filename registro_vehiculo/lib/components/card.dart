import 'package:flutter/material.dart';
import 'package:foro2/models/avion.dart';
import 'package:foro2/models/vehiculoBus.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:foro2/screens/formulario_screen.dart';

class MiCard extends StatelessWidget {
  final Avion? vehiculoAvion;
  final VehiculoBus? vehiculoBusOtro;
  final String? tipoVehiculo;
  final Function? handleOnUpdateVehiculo;
  final Function? handleOnUpdateBus;
  final Function? handleOnUpdateAvion;

  const MiCard(
      {super.key,
      this.vehiculoAvion,
      this.vehiculoBusOtro,
      this.tipoVehiculo,
      this.handleOnUpdateVehiculo,
      this.handleOnUpdateBus,
      this.handleOnUpdateAvion});


  Widget setupAlertDialoadContainer(
      String imagen,
      String origen,
      String destino,
      String duracion,
      double precio,
      double isv,
      double precioTotal,
      [double cargospPorServicio = 0]) {
    return SizedBox(
        width: double
            .maxFinite, // double. maxFinite es una constante que se usa en Flutter para definir que la altura o anchura de un widget será el máximo que permita su widget padre.
        child: ListView(
          children: [
            Column(

              children: [

                SizedBox(height: 80),
                CircleAvatar(
                  backgroundImage: NetworkImage(imagen),
                  radius: 100,
                ),

                SizedBox(height: 20),

                // Richtext : he RichText widget displays text that uses multiple different styles/ es un widget para mostrar texto de diferente estilo
                // Textspan: which is used to describe the text in a paragraph. es usadoo para describir texto del parrafo / Fuente: https://api.flutter.dev/flutter/widgets/RichText-class.html
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Origen :',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: origen,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0))),
                    ],
                  ),
                ),

                SizedBox(height: 15),

                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Destino :',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: destino,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0))),
                    ],
                  ),
                ),

                SizedBox(height: 15),

                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Duración :',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: duracion,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0))),
                    ],
                  ),
                ),


                // con ayuda de chat gpt pude resolver el problema , aqui en la condiicional
                // La razón por la que no era necesario usar {} en este caso es porque en Flutter, cuando se usa  if dentro de children: [] se debe colocar el if sin "{}" coomo normalmente se hace .

                if (cargospPorServicio != 0)
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                            text: 'Cargo Por servicio :',
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "$cargospPorServicio",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0))),
                      ],
                    ),
                  ),

                // o se puede usar como vimos en clase 

                // cargospPorServicio != 0
                // ?RichText(
                //   text: TextSpan(
                //     children: <TextSpan>[
                //       const TextSpan(
                //           text: 'Cargo Por servicio :',
                //           style: TextStyle(
                //               color: Color.fromARGB(255, 0, 0, 0),
                //               fontWeight: FontWeight.bold)),
                //       TextSpan(
                //           text: "$cargospPorServicio",
                //           style: const TextStyle(
                //               color: Color.fromARGB(255, 0, 0, 0))),
                //     ],
                //   ),
                // )
                // :Container(),

                SizedBox(height: 15),

                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Precio :',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "$precio USD",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0))),
                    ],
                  ),
                ),

                SizedBox(height: 15),

                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'ISV :',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "$isv USD",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0))),
                    ],
                  ),
                ),

                SizedBox(height: 15),

                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Precio total :',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "$precioTotal USD",
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

  @override
  Widget build(BuildContext context) {
    bool esAvion = vehiculoAvion != null;

    if (vehiculoAvion == null && vehiculoBusOtro == null) {
      return Text("vacio"); 
    }

    //chat gpt
    // El operador ! en Dart se llama "assertion operator" o "null check operator", y se usa para decirle al compilador que estás 100% seguro de que una variable opcional (null safety) no es null.

    // en visual studio
    // The property 'imagen' can't be unconditionally accessed because the receiver can be 'null'.
    // Try making the access conditional (using '?.') or adding a null check to the target ('!').dartunchecked_use_of_nullable_value

    // documentacion en dart
    // The null assertion operator (!)
    // If you’re sure an expression with a nullable type doesn’t equal null, you can use the null assertion operator (!) to make Dart treat it as non-nullable. By adding ! after the expression, you assert two conditions to Dart about the expression:


    // Its value doesn’t equal null
    // Dart can assign the value to a non-nullable variable


    // https://dart.cn/codelabs/null-safety#:~:text=')%3B%20%7D-,The%20null%20assertion%20operator%20(!),value%20doesn't%20equal%20null

    String imagen = esAvion ? vehiculoAvion!.imagen : vehiculoBusOtro!.imagen;
    String origen = esAvion ? vehiculoAvion!.origen : vehiculoBusOtro!.origen;
    String destino =
        esAvion ? vehiculoAvion!.destino : vehiculoBusOtro!.destino;
    double precio = esAvion ? vehiculoAvion!.precio : vehiculoBusOtro!.precio;
    String duracion =
        esAvion ? vehiculoAvion!.duracionVuelo : vehiculoBusOtro!.duracionViaje;
    double isv = esAvion ? vehiculoAvion!.isv : vehiculoBusOtro!.isv;
    

    
    double cargospPorServicio = esAvion ? vehiculoAvion!.cargosPorServicio : 0;

    double precioTotal =
        esAvion ? precio+cargospPorServicio+isv : precio+isv;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: imagen,
                width: 80.0,
                height: 80.0,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Text(
                  "origen: $origen",
                ),
                const SizedBox(
                  height: 5,
                ),
                Text("Destino: $destino"),
                const SizedBox(
                  height: 5,
                ),
                Text("Precio Total: ${precio+isv+cargospPorServicio} (USD)"),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
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
                                  content: setupAlertDialoadContainer(
                                      imagen,
                                      origen,
                                      destino,
                                      duracion,
                                      precio,
                                      isv,
                                      precioTotal,
                                      cargospPorServicio));
                            });
                      },
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    GestureDetector(
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                        size: 24.0,
                      ),
                      onTap: () {
                        if (tipoVehiculo == "Avion") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CrearVehiculoAvionForm(
                                tipoVehiculo: tipoVehiculo!,
                                avion: vehiculoAvion,
                                handleOnUpdateAvion: handleOnUpdateAvion,
                              ),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CrearVehiculoAvionForm(
                                tipoVehiculo: tipoVehiculo!,
                                vehiculoBus: vehiculoBusOtro,
                                handleOnCreateBus: handleOnUpdateBus,
                                handleOnUpdateVehiculo: handleOnUpdateVehiculo,
                                handleOnUpdateBus: handleOnUpdateBus,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
