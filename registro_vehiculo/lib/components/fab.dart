import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../screens/formulario_screen.dart';

class MiFAB extends StatelessWidget {
  final Function handleOnCreateVehiculo;
  final Function handleOnCreateBus;
  final Function handleOnCreateSAvion;

  const MiFAB(
      {super.key,
        required this.handleOnCreateVehiculo,
        required this.handleOnCreateBus,
        required this.handleOnCreateSAvion
      });

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      buttonSize: const Size(50, 50),
      activeIcon: Icons.close,
      visible: true,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.bus_alert_outlined),
          labelWidget: const Text(
            'Agregar Bus',
            style: TextStyle(fontSize: 20),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CrearVehiculoAvionForm(
                  tipoVehiculo: "Bus",
                   handleOnCreateBus: handleOnCreateBus,
                ),
              ),
            );
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.airplanemode_active),
          labelWidget: const Text(
            'Agregar avion',
            style: TextStyle(fontSize: 20),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CrearVehiculoAvionForm(
                  tipoVehiculo: "Avion",
                  handleOnCreateSAvion: handleOnCreateSAvion,
                ),
              ),
            );
          },
        ),
         SpeedDialChild(
          child: const Icon(Icons.emoji_transportation),
          labelWidget: const Text(
            'Agregar vehiculo',
            style: TextStyle(fontSize: 20),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
               builder: (context) => CrearVehiculoAvionForm(
                  tipoVehiculo: "Vehiculo",
                  handleOnCreateVehiculo: handleOnCreateVehiculo,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}