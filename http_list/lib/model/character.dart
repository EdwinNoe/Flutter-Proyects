class Character {
  int id;
  String name;
  dynamic img;
  dynamic country;

  Character.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        img = json['image'],
        country = json['country'];

  // Character.fromJson(Map json)
  //     : id = json['person']['id'],
  //       name = json['person']['name'],
  //       img = json['person']['image'],
  //       country = json['person']['country'];

  Map toJson() {
    return {'id': id, 'name': name, 'image': img, 'country': country};
  }
}
