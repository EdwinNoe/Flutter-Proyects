// Fuente para la estructuración  de proyectos  en  flutter
// https://www.youtube.com/watch?v=F21YTGQLI4M&ab_channel=AbsaCoding

import 'package:flutter/material.dart';
import 'package:foro2/components/card.dart';
import 'package:foro2/models/avion.dart';
import 'package:foro2/models/vehiculoBus.dart';
import 'components/drawer.dart';
import 'components/fab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avis',
      home: const MyHomePage(title: 'Avis'),
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

  List<Avion> aviones = [];
  List<VehiculoBus> buses = [];
  List<VehiculoBus> vehiculos = [];

  handleOnCreateVehiculo(VehiculoBus vehiculo) {
    setState(() {
      vehiculos.add(vehiculo);
    });
    
  }

  
  handleOnCreateBus(VehiculoBus vehiculo) {
    setState(() {
      buses.add(vehiculo);
    });
    
  }

  handleOnCreateSAvion(Avion vehiculo) {
    setState(() {
      aviones.add(vehiculo);
    });
  }

  void handleOnUpdateVehiculo(int id, VehiculoBus updatedVehiculo) {
    setState(() {
      for (int i = 0; i < vehiculos.length; i++) {
        if (vehiculos[i].id == id) {
          vehiculos[i] = updatedVehiculo;
          break; 
        }
      }
    });
  }

  void handleOnUpdateBus(int id, VehiculoBus updatedBus) {
    setState(() {
      for (int i = 0; i < buses.length; i++) {
        if (buses[i].id == id) {
          buses[i] = updatedBus;
          break;
        }
      }
    });
  }

  void handleOnUpdateAvion(int id, Avion updatedAvion) {
    setState(() {
      for (int i = 0; i < aviones.length; i++) {
        if (aviones[i].id == id) {
          aviones[i] = updatedAvion;
          break;
        }
      }
    });
}



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Color(0xFF9ACBD0),
          appBar: AppBar(
            backgroundColor: Color(0xFF2973B2),
            centerTitle:
                true, 
            title: Text(widget.title,
                style: TextStyle(
                    color: Color(0xFFF2EFE7), 
                ),
            ),
            bottom: const TabBar(
                 labelColor: Color(0xFFF2EFE7), // Color del texto de la pestaña seleccionada
                  unselectedLabelColor: Color.fromARGB(255, 202, 202, 202), // Color de las pestañas no seleccionadas
                //referencia https://api.flutter.dev/flutter/material/TabBar-class.html
              tabs: [
                Tab(text: 'Buses'),
                Tab(text: 'Aviones '),
                Tab(text: 'Vehículos'),
              ],
            ),
          ),
          body: 
          TabBarView(
            children: [
              ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: buses.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MiCard(vehiculoBusOtro: buses[index], tipoVehiculo: "Bus", handleOnUpdateAvion:handleOnUpdateAvion ,handleOnUpdateVehiculo: handleOnUpdateVehiculo,handleOnUpdateBus: handleOnUpdateBus );
                  }),
              ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: aviones.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MiCard(vehiculoAvion: aviones[index], tipoVehiculo: "Avion", handleOnUpdateAvion:handleOnUpdateAvion ,handleOnUpdateVehiculo: handleOnUpdateVehiculo,handleOnUpdateBus: handleOnUpdateBus);
                  }),
              ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: vehiculos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MiCard(vehiculoBusOtro: vehiculos[index], tipoVehiculo: "Vehiculo", handleOnUpdateAvion:handleOnUpdateAvion ,handleOnUpdateVehiculo: handleOnUpdateVehiculo,handleOnUpdateBus: handleOnUpdateBus);
                  })
            ],
          ),
          drawer: MiDrawer(handleOnCreateBus: handleOnCreateBus, handleOnCreateSAvion: handleOnCreateSAvion, handleOnCreateVehiculo: handleOnCreateVehiculo),
          floatingActionButton: MiFAB(handleOnCreateBus: handleOnCreateBus, handleOnCreateSAvion: handleOnCreateSAvion, handleOnCreateVehiculo: handleOnCreateVehiculo),
        ),
      ),
    );
  }
}
