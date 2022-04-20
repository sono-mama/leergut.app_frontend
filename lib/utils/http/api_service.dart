import 'dart:convert';
import 'dart:io';

import 'package:frontend/utils/http/news_model.dart';
import 'package:http/http.dart' as http;

import 'constants.dart';

class ApiService {

Future<News> fetchNewsModel(String pagination) async {
  final response = await http.get(
      Uri.parse(ApiConstants.devUrl + ApiConstants.newsEndpoint + pagination),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJyb2xlIjoiVVNFUiIsInN1YiI6InRlc3RuYW1lNSIsImlhdCI6MTY1MDQ0NjYwOSwiZXhwIjoxNjUwNDc1NDA5fQ.flTwyBC_gT65wPsji5UbxKKaaE1ElYFZi-qNvacWKEpJFCFEU4eDYURZyThQ4JHyl5URRuuPsFwiAaETaz0TnQ'
      });

  //print(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return News.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}



}
