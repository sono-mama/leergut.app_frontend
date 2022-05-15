import 'dart:convert';
import 'dart:io';

import 'package:frontend/utils/auth/cache_manager.dart';
import 'package:frontend/utils/http/auth/jwt_model.dart';
import 'package:frontend/utils/http/auth/jwt_parser.dart';
import 'package:frontend/utils/http/news_model.dart';
import 'package:frontend/utils/http/transaction_model.dart';
import 'package:frontend/utils/http/transaction_response_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import 'constants.dart';

class ApiService extends GetConnect with CacheManager {


  Future<News> fetchNewsModel(String pagination) async {
    final response = await get(
        Uri.parse(ApiConstants.devUrl + ApiConstants.newsEndpoint + pagination),
        headers: {
          HttpHeaders.authorizationHeader:
              'Bearer eyJhbGciOiJIUzUxMiJ9.eyJyb2xlIjoiVVNFUiIsInN1YiI6InRlc3RuYW1lNSIsImlhdCI6MTY1MTA0NDA3OCwiZXhwIjoxNjUxMDcyODc4fQ.jt27qIXeCjPnM_NuKJXe22535cwFfzhPfgVjSvsRznFMWmqbArWKFdSzCIIFliondwHcsO-O3HcaE-xBROPsEw'
        });

    print(response.body);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return News.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load');
    }
  }

  Future<TransactionResponseModel?> fetchTransaction(
      TransactionModel model) async {
    String? token = getToken();
    JwtModel jwt = JwtModel.fromJson(JwtParser().parseJwt(token!));
    String? user = jwt.sub;
    Uri transactionUrl = Uri.parse(ApiConstants.devUrl + '/user/$user/transaction');
    final response = await post(transactionUrl,
        headers: {
      'Content-Type':'application/json',
      'Authorization': 'Bearer $token',
    },
        body: json.encode(model.toJson()));


    if (response.statusCode == HttpStatus.ok) {
      return TransactionResponseModel.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}
