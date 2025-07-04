import 'package:flutter/material.dart';
import '../screens/formulario_screen.dart';

class MiDrawer extends StatelessWidget {

  final Function handleOnCreateVehiculo;
  final Function handleOnCreateBus;
  final Function handleOnCreateSAvion;

  const MiDrawer(
      {super.key, 
       required this.handleOnCreateVehiculo,
        required this.handleOnCreateBus,
        required this.handleOnCreateSAvion         
      });
      
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF9ACBD0),
            ),

            child: Align( ///Align es un widget en Flutter que te permite posicionar a su hijo en un lugar específico dentro de su contenedor. https://api.flutter.dev/flutter/widgets/Align-class.html
              alignment: Alignment.center,
              child: Text('Creación de transporte'),
            ),

          ),

          ListTile(
            leading: const Icon(Icons.emoji_transportation),
            title: const Text('Vehículos'),
            onTap: () {
              Navigator.pop(context);
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

          ListTile(
            leading: const Icon(Icons.bus_alert_outlined),
            title: const Text('Buses'),
            onTap: () {
              Navigator.pop(context);
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
          
          ListTile(
            leading: const Icon(Icons.airplanemode_active),
            title: const Text('Aviones'),
            onTap: () {
              Navigator.pop(context);
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
        ],
      ),
    );
  }
}
