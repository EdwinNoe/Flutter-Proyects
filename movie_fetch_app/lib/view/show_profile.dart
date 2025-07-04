import 'package:flutter/material.dart';
import '../models/shows.dart';

class ShowProfile extends StatefulWidget {
  final Show showobj;
  const ShowProfile({super.key, required this.showobj});

  @override
  State<ShowProfile> createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  String flag = "";

  @override
  Widget build(BuildContext context) {

    if (widget.showobj.country != 'N/A') {
      String countryCode = widget.showobj.country['code'] ?? 'N/A';
      if (countryCode != "N/A") {
        flag = countryCode.toUpperCase().replaceAllMapped(
          RegExp(r'[A-Z]'),
          (match) => String.fromCharCode(
            match.group(0)!.codeUnitAt(0) + 127397,
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil ${widget.showobj.name}"),
      ),
      body: SingleChildScrollView(
        
        child: Column(
           children: [
            widget.showobj.image != 'N/A'
            ?Image.network(
              height: 400.0,
                widget.showobj.image != 'N/A'
                    ? widget.showobj.image['original']
                    : 'assets/images/person.jpg',
            )
            :Image.asset(
              height: 250.0,
              "assets/images/person.jpg"
            ),
            SizedBox(height: 10),
            Text(
              "Nombre: ${widget.showobj.name}",
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10),
            Text(
              "Id: ${widget.showobj.id}",
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10),
            Text(
              "Pais: ${widget.showobj.country != 'N/A' ? widget.showobj.country['name'] : 'N/A'}",
              style: TextStyle(fontSize: 18.0),
            ),
            flag.isNotEmpty
              ? Text(flag)
              : Text(" N/A"),

            SizedBox(height: 10),
            
            Text(
              "Tipo: ${widget.showobj.type}",
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10),
            Text(
              "Idioma: ${widget.showobj.language}",
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10),
            Text(
              "Rating: ${widget.showobj.rating}",
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10),

            widget.showobj.genres.isNotEmpty 
            ?Text(
              "Genero: ${widget.showobj.genres.join(', ')}",
              style: TextStyle(fontSize: 18.0),
            )
            :Text(
              "Genero: N/A",
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10),
            Text(
              "Link: ${widget.showobj.url}",
              style: TextStyle(fontSize: 18.0),
            ),
          ],
    

        ),
     
      ),
    );
  }
}
