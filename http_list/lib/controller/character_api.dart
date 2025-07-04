import 'dart:async';
import 'package:http/http.dart' as http;

class CharacterApi {
  static Future getCharacters() {
    return http.get(Uri.https("api.tvmaze.com", "/people"));
    //return http.get(Uri.https("api.tvmaze.com", "/search/people", {'q': 'ana'}));
  }
}
