import 'dart:convert';

import '../controller/character_api.dart';
import '../model/character.dart';
import 'package:flutter/material.dart';

class CharacterList extends StatefulWidget {
  CharacterList({super.key});

  @override
  _CharacterListState createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  List<Character> characterList = [];

  void getCharactersfromApi() async {
    CharacterApi.getCharacters().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        characterList = list.map((model) => Character.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCharactersfromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Actores"),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: characterList.length,
              itemBuilder: (context, index) {
                Character person = characterList[index];
                String flag = "";
                if (person.country != null) {
                  // .replaceAllMapped() reemplaza cada caracter encontrado
                  // RegExp(r'[A-Z]') selecciona cada caracter evaluado segun regex
                  // .fromCharCode() convierte los valores de los símbolos del indicador regional en una cadena (emoji de bandera)
                  // .group(0) evalua que la cadena coincida con el grupo dado. Si el grupo es 0, devuelve la coincidencia completa del patrón.
                  // .codeUnitAt(0) devuelve la unidad de código UTF-16 de 16 bits en el índice dado
                  // + 127397 convierte cada caracter en un símbolo indicador regional.: https://en.wikipedia.org/wiki/Regional_indicator_symbol

                  flag = person.country['code'].toUpperCase().replaceAllMapped(
                      RegExp(r'[A-Z]'),
                      (match) => String.fromCharCode(
                          match.group(0).codeUnitAt(0) + 127397));
                }

                return ListTile(
                  title: Text(person.name),
                  subtitle: Text(person.country != null
                      ? '$flag ${person.country['name']}'
                      : 'Sin pais'),
                  leading: person.img != null
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(person.img['medium']),
                        )
                      : Image.asset(
                          'assets/images/person.jpg',
                          width: 40,
                          height: 40,
                        ),
                );
              }),
        ));
  }
}
