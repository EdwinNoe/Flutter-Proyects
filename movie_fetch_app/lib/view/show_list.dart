import 'package:flutter/material.dart';
import '../models/shows.dart';
import '../controllers/show_api.dart';
import 'dart:convert';
import '../view/show_profile.dart';

class ShowList extends StatefulWidget {
  final String busqueda;
  const ShowList({super.key, required this.busqueda});

  @override
  State<ShowList> createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {
  List<Show> showList = [];

  void getShowsFromApi(q) async {
    ShowsApi.getShows(q).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        showList = list.map((model) => Show.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getShowsFromApi(widget.busqueda);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultados"),
      ),
      body: showList.isEmpty
          ? Center(
              child: Text(
                "No se encontraron registros",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            )
          : Container(
              child: ListView.builder(
                itemCount: showList.length,
                itemBuilder: (context, index) {
                  Show show = showList[index];

                  String flag = "";
                  if (show.country != 'N/A') {
                    String countryCode = show.country['code'] ?? 'N/A';
                    if (countryCode != "N/A") {
                      flag = countryCode.toUpperCase().replaceAllMapped(
                            RegExp(r'[A-Z]'),
                            (match) => String.fromCharCode(
                                match.group(0)!.codeUnitAt(0) + 127397),
                          );
                    }
                  }

                  return Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        show.image != 'N/A'
                            ? CircleAvatar(
                                radius: 40.0,
                                backgroundImage: NetworkImage(
                                  show.image != 'N/A'
                                      ? show.image['medium']
                                      : 'assets/images/person.jpg',
                                ),
                              )
                            : Image.asset(
                                'assets/images/person.jpg',
                                width: 40,
                                height: 40,
                              ),
                        Column(
                          children: [
                            Text("Nombre: ${show.name}"),
                            Text("Pais: ${show.country != 'N/A' ? show.country['name'] : 'N/A'}"),
                            flag.isNotEmpty
                                ? Text(flag)
                                : Text(" N/A"),
                            Container(
                              child: Row(
                                children: [
                                  Text("Rating: ${show.rating}"),
                                  SizedBox(width: 8.0),
                                  Icon(Icons.thumb_up, color: Colors.blue),
                                ],
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowProfile(showobj: show),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.arrow_forward,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
