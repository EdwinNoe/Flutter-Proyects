import 'dart:async';
import 'package:http/http.dart' as http;

class ShowsApi {
  static Future getShows(String q) {
    return http.get(Uri.https("api.tvmaze.com", "/search/shows", {'q': q}));
  }
}
