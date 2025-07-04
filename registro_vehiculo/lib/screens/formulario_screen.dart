import 'package:flutter/material.dart';
import 'dart:math';
import '../models/avion.dart';
import '../models/vehiculoBus.dart';

class CrearVehiculoAvionForm extends StatefulWidget {
  final String tipoVehiculo;
  final Function? handleOnCreateVehiculo;
  final Function? handleOnCreateBus;
  final Function? handleOnCreateSAvion;

  final Function? handleOnUpdateVehiculo;
  final Function? handleOnUpdateBus;
  final Function? handleOnUpdateAvion;

  final VehiculoBus? vehiculoBus;
  final Avion? avion;

  const CrearVehiculoAvionForm(
      {super.key,
      required this.tipoVehiculo,
      this.handleOnCreateVehiculo,
      this.handleOnCreateBus,
      this.handleOnCreateSAvion,
      this.avion,
      this.vehiculoBus,
      this.handleOnUpdateVehiculo,
      this.handleOnUpdateBus,
      this.handleOnUpdateAvion});

  @override
  _CrearVehiculoForm createState() => _CrearVehiculoForm();
}

class _CrearVehiculoForm extends State<CrearVehiculoAvionForm> {
  // Visual studiio
//   (new) TextEditingController TextEditingController({String? text})
// package:flutter/src/widgets/editable_text.dart
// Creates a controller for an editable text field, with no initial selection.
// This constructor treats a null [text] argument as if it were the empty string.
// The initial selection is TextSelection.collapsed(offset: -1). This indicates that there is no selection at all ([TextSelection.isValid] is false in this case). When a text field is built with a controller whose selection is not valid, the text field will update the selection when it is focused (the selection will be an empty selection positioned at the end of the text).
// Consider using [TextEditingController.fromValue] to initialize both the text and the selection.

  final _formKey = GlobalKey<FormState>();

  TextEditingController _idController = TextEditingController();

  TextEditingController _origenController = TextEditingController();
  TextEditingController _destinoController = TextEditingController();
  TextEditingController _numeroAsientosController = TextEditingController();
  TextEditingController _precioController = TextEditingController();
  TextEditingController _isvController = TextEditingController();
  TextEditingController _duracionController = TextEditingController();

  TextEditingController _marcaController = TextEditingController();
  TextEditingController _modeloController = TextEditingController();
  TextEditingController _anioController = TextEditingController();

  TextEditingController _tipoAvionController = TextEditingController();
  TextEditingController _numerobanosController = TextEditingController();
  TextEditingController _tiposnacksController = TextEditingController();
  TextEditingController _cargoServcioController = TextEditingController();

  List<String> imagenesAvion = [
    'https://media.cnn.com/api/v1/images/stellar/prod/cnne-1607777-c919-asi-es-el-primer-avion-de-fabricacion-china.jpg?c=16x9&q=w_1280,c_fill',
    'http://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqZrX2Ur7lA3cIkoNwouiFCkVwkxDYD_HAzw&s',
    'https://fotografias.larazon.es/clipping/cmsimages02/2024/06/27/14E1A017-BA95-4005-ABB0-E1B313DDB846/asi-nuevo-avion-airbus-revolucion-vuelos-transoceanicos_98.jpg?crop=730,411,x0,y68&width=1900&height=1069&optimize=low&format=webply',
  ];

  List<String> imagenesBus = [
   "https://www.elheraldo.hn/binrepository/1200x900/0c155/1200d630/none/45933/FYSK/buses-prueba-piloto-anillo-periferico_7169615_20240407165043.jpg"
  ];

  List<String> imagenesVehiculo = [
   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZc2zSHpyfRtmdTza6MvxLyxx98dGH-oWF_g&s"
   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQri6NIlZB3LCeVfU9oWVK9fviMW5JsyZl07A&s"
  ];

  @override
  void initState() {
    super.initState();

    if (widget.avion != null || widget.vehiculoBus != null) {
      _idController = TextEditingController(
          text:
              "${widget.avion != null ? widget.avion!.id : (widget.vehiculoBus != null ? widget.vehiculoBus!.id : "")}");
      _origenController = TextEditingController(
          text: widget.avion != null
              ? widget.avion!.origen
              : (widget.vehiculoBus != null ? widget.vehiculoBus!.origen : ""));
      _destinoController = TextEditingController(
          text: widget.avion != null
              ? widget.avion!.destino
              : (widget.vehiculoBus != null
                  ? widget.vehiculoBus!.destino
                  : ""));
      _numeroAsientosController = TextEditingController(
          text:
              "${widget.avion != null ? widget.avion!.numeroAsientos : (widget.vehiculoBus != null ? widget.vehiculoBus!.numeroAsientos : "")}");
      _precioController = TextEditingController(
          text:
              "${widget.avion != null ? widget.avion!.precio : (widget.vehiculoBus != null ? widget.vehiculoBus!.precio : "")}");

      _isvController = TextEditingController(
          text:
              "${widget.avion != null ? widget.avion!.isv : (widget.vehiculoBus != null ? widget.vehiculoBus!.isv : "")}");
      _duracionController = TextEditingController(
          text: widget.avion != null
              ? widget.avion!.duracionVuelo
              : (widget.vehiculoBus != null
                  ? widget.vehiculoBus!.duracionViaje
                  : ""));

      if (widget.avion != null) {
        _tipoAvionController =
            TextEditingController(text: widget.avion!.tipoAvion);
        _numerobanosController =
            TextEditingController(text: widget.avion!.numeroBanos.toString());
        _tiposnacksController =
            TextEditingController(text: widget.avion!.tipoSnacks);
        _cargoServcioController = TextEditingController(
            text: widget.avion!.cargosPorServicio.toString());
      } else {
        _marcaController =
            TextEditingController(text: widget.vehiculoBus!.marca);
        _modeloController =
            TextEditingController(text: widget.vehiculoBus!.modelo);
        _anioController =
            TextEditingController(text: widget.vehiculoBus!.anio.toString());
      }
    } else {
      _idController = TextEditingController();

      _origenController = TextEditingController();
      _destinoController = TextEditingController();
      _numeroAsientosController = TextEditingController();
      _precioController = TextEditingController();
      _isvController = TextEditingController();
      _duracionController = TextEditingController();

      _marcaController = TextEditingController();
      _modeloController = TextEditingController();
      _anioController = TextEditingController();

      _tipoAvionController = TextEditingController();
      _numerobanosController = TextEditingController();
      _tiposnacksController = TextEditingController();
      _cargoServcioController = TextEditingController();
    }
  }

  void _CrearVehiculo() {
    final String id = _idController.text;
    final String origen = _origenController.text;
    final String destino = _destinoController.text;
    final String numeroAsiento = _numeroAsientosController.text;
    final String precio = _precioController.text;
    final String isv = _isvController.text;
    final String duracion = _duracionController.text;

    final String marca = _marcaController.text;
    final String modelo = _modeloController.text;
    final String anio = _anioController.text;
    final String tipoAvion = _tipoAvionController.text;
    final String numeroBanos = _numerobanosController.text;
    final String tipoSnacks = _tiposnacksController.text;
    final String cargoServicio = _cargoServcioController.text;

    final String imagenAvion =
        imagenesAvion[Random().nextInt(imagenesAvion.length)];
    final String imagenBus = imagenesBus[Random().nextInt(imagenesBus.length)];
    final String imagenVehiculo =
        imagenesVehiculo[Random().nextInt(imagenesVehiculo.length)];

    if (widget.tipoVehiculo == "Avion") {
      widget.handleOnCreateSAvion!(Avion(
          id: int.parse(id),
          imagen: imagenAvion,
          origen: origen,
          destino: destino,
          tipoAvion: tipoAvion,
          numeroAsientos: int.parse(numeroAsiento),
          numeroBanos: int.parse(numeroBanos),
          tipoSnacks: tipoSnacks,
          duracionVuelo: duracion,
          cargosPorServicio: double.parse(cargoServicio),
          precio: double.parse(precio),
          isv: double.parse(isv)));
    } else if (widget.tipoVehiculo == "Bus") {
      widget.handleOnCreateBus!(VehiculoBus(
          id: int.parse(id),
          imagen: imagenBus,
          origen: origen,
          destino: destino,
          marca: marca,
          modelo: modelo,
          anio: int.parse(anio),
          numeroAsientos: int.parse(numeroAsiento),
          duracionViaje: duracion,
          precio: double.parse(precio),
          isv: double.parse(isv)));
    } else {
      widget.handleOnCreateVehiculo!(VehiculoBus(
          id: int.parse(id),
          imagen: imagenVehiculo,
          origen: origen,
          destino: destino,
          marca: marca,
          modelo: modelo,
          anio: int.parse(anio),
          numeroAsientos: int.parse(numeroAsiento),
          duracionViaje: duracion,
          precio: double.parse(precio),
          isv: double.parse(isv)));
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue,
        elevation: 2,
        duration: const Duration(seconds: 3),
        content: Text('Se creó con éxito el ${widget.tipoVehiculo}'),
      ),
    );
  }

  void _ActualizarVehiculo() {
    final String id = _idController.text;
    final String origen = _origenController.text;
    final String destino = _destinoController.text;
    final String numeroAsiento = _numeroAsientosController.text;
    final String precio = _precioController.text;
    final String isv = _isvController.text;
    final String duracion = _duracionController.text;

    final String marca = _marcaController.text;
    final String modelo = _modeloController.text;
    final String anio = _anioController.text;
    final String tipoAvion = _tipoAvionController.text;
    final String numeroBanos = _numerobanosController.text;
    final String tipoSnacks = _tiposnacksController.text;
    final String cargoServicio = _cargoServcioController.text;

    if (widget.tipoVehiculo == "Avion") {
      final String imagenAvion = widget.avion!.imagen;
      Avion newAvion = Avion(
          id: int.parse(id),
          imagen: imagenAvion,
          origen: origen,
          destino: destino,
          tipoAvion: tipoAvion,
          numeroAsientos: int.parse(numeroAsiento),
          numeroBanos: int.parse(numeroBanos),
          tipoSnacks: tipoSnacks,
          duracionVuelo: duracion,
          cargosPorServicio: double.parse(cargoServicio),
          precio: double.parse(precio),
          isv: double.parse(isv));

      widget.handleOnUpdateAvion!(widget.avion!.id, newAvion);

    } else {
      final String imagenVehiculo = widget.vehiculoBus!.imagen;
      VehiculoBus newVehiculo = VehiculoBus(
          id: int.parse(id),
          imagen: imagenVehiculo,
          origen: origen,
          destino: destino,
          marca: marca,
          modelo: modelo,
          anio: int.parse(anio),
          numeroAsientos: int.parse(numeroAsiento),
          duracionViaje: duracion,
          precio: double.parse(precio),
          isv: double.parse(isv));

      if (widget.tipoVehiculo == "Bus") {
        widget.handleOnUpdateBus!(widget.vehiculoBus!.id, newVehiculo);
      } else {
        widget.handleOnUpdateVehiculo!(widget.vehiculoBus!.id, newVehiculo);
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        elevation: 2,
        duration: const Duration(seconds: 3),
        content: Text('${widget.tipoVehiculo} actualizado con éxito'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear ${widget.tipoVehiculo}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _idController,
                  decoration: const InputDecoration(labelText: 'Id'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingrese el id';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _origenController,
                  decoration: const InputDecoration(labelText: 'Origen'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingrese el Origen';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _destinoController,
                  decoration: const InputDecoration(labelText: 'Destino'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingrese el Destino';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _numeroAsientosController,
                  decoration:
                      const InputDecoration(labelText: 'Numero De Asientos'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingrese el numero de Asientos';
                    }

                    final numero = int.parse(value);

                    if (numero <= 0) {
                      return 'Por favor, ingrese el numero de Asientos Positivo';
                    }

                    return null;
                  },
                ),
                TextFormField(
                  controller: _precioController,
                  decoration: const InputDecoration(labelText: 'Precio'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingrese el Precio';
                    }

                    final numero = double.parse(value);

                    if (numero <= 0) {
                      return 'Por favor, ingrese el Precio Positivo';
                    }

                    return null;
                  },
                ),
                TextFormField(
                  controller: _isvController,
                  decoration: const InputDecoration(labelText: 'ISV'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingrese el ISV';
                    }

                    final numero = double.parse(value);

                    if (numero <= 0) {
                      return 'Por favor, ingrese el ISV Positivo';
                    }

                    return null;
                  },
                ),
                TextFormField(
                  controller: _duracionController,
                  decoration: InputDecoration(
                      labelText:
                          'Duracion del ${widget.tipoVehiculo == "Avion" ? "vuelo" : "viaje"}'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, ingrese la duracion del vaje';
                    }
                    return null;
                  },
                ),
                widget.tipoVehiculo == "Bus" ||
                        widget.tipoVehiculo == "Vehiculo"
                    ? Column(
                        children: [
                          TextFormField(
                            controller: _marcaController,
                            decoration: const InputDecoration(
                                labelText: 'ingrese marca'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Por favor, ingrese la marca';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _modeloController,
                            decoration: const InputDecoration(
                                labelText: 'ingrese modelo'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Por favor, ingrese el Modelo';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _anioController,
                            decoration:
                                const InputDecoration(labelText: 'ingrese año'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Por favor, ingrese el año';
                              }
                              return null;
                            },
                          )
                        ],
                      )
                    : Column(
                        children: [
                          TextFormField(
                            controller: _tipoAvionController,
                            decoration: const InputDecoration(
                                labelText: 'ingrese tipo de avion'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Por favor, ingrese tipo de avion';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _numerobanosController,
                            decoration: const InputDecoration(
                                labelText: 'ingrese numero de baños'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Por favor, numero de baños';
                              }

                              
                              final numero = int.parse(value);

                              if (numero <= 0) {
                                return 'Por favor, ingrese el numero de baños Positivo';
                              }

                              
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _tiposnacksController,
                            decoration: const InputDecoration(
                                labelText: 'ingrese tipo de snacks'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Por favor, ingrese el tipo de snacks';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _cargoServcioController,
                            decoration: const InputDecoration(
                                labelText: 'ingrese cargos por servicio'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Por favor, ingrese cargos por servicio';
                              }

                                                            
                              final numero = double.parse(value);

                              if (numero <= 0) {
                                return 'Por favor, El valor de Cargos por servicio debe ser positivo';
                              }

                              return null;
                            },
                          ),
                        ],
                      ),
                const SizedBox(height: 16),
                (widget.vehiculoBus != null || widget.avion != null)
                    ? Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _ActualizarVehiculo();
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Guardar'),
                        ),
                      )
                    : Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _CrearVehiculo();

                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Crear'),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
