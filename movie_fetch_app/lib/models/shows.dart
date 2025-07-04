class Show {
  int id;
  String name;
  dynamic image;
  dynamic country;
  double rating; 
  String type;
  String language;
  dynamic genres;
  String url;

  Show.fromJson(Map json)
      : id = json['show']['id'] ?? 0, 
        name = json['show']['name'] ?? 'N/A',
        image = json['show']['image'] ?? 'N/A',
        country = json['show']['network']?['country'] ?? 'N/A',
        rating = json['show']['rating']?['average'] is double 
            ? json['show']['rating']['average']
            : 0.0, 
        type = json['show']['type'] ?? 'N/A',
        language = json['show']['language'] ?? 'N/A',
        genres = json['show']['genres'] ?? 'N/A',
        url = json['show']['url'] ?? 'N/A';

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'country': country,
      'rating': rating, 
    };
  }
}
