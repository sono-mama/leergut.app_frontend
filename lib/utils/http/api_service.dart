import 'dart:convert';
import 'dart:io';

import 'package:frontend/utils/auth/cache_manager.dart';
import 'package:frontend/utils/http/auth/jwt_model.dart';
import 'package:frontend/utils/http/auth/jwt_parser.dart';
import 'package:frontend/utils/http/news_model.dart';
import 'package:frontend/utils/http/past_transaction_model.dart';
import 'package:frontend/utils/http/payout_response_model.dart';
import 'package:frontend/utils/http/transaction_model.dart';
import 'package:frontend/utils/http/transaction_response_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import 'auth/user_model.dart';
import 'constants.dart';

class ApiService extends GetConnect with CacheManager {

  Future<News> fetchNewsModel(String pagination, Client http) async {
    String? token = getToken();
    Uri newsUrl = Uri.parse(ApiConstants.devUrl + ApiConstants.newsEndpoint + pagination);
    final response = await http.get(
        newsUrl,
        headers: {
          'Content-Type':'application/json',
          'Authorization': 'Bearer $token',
        });

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

  Future<TransactionResponseModel> fetchTransaction(
      TransactionModel model, List tokenUser) async {
    String? token = tokenUser[0];
    String? user = tokenUser[1];
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
      throw Exception('Failed to load');
    }
  }

  Future<UserModel> fetchUser(Client http, List tokenUser) async {
    String? token = tokenUser[0];
    String? user = tokenUser[1];
    Uri userUrl = Uri.parse(ApiConstants.devUrl + '/user/$user');
    final response = await http.get(userUrl,
        headers: {
          'Content-Type':'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == HttpStatus.ok) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<PastTransactionModel> fetchPastTransactions(Client http, List tokenUser) async {
    String? token = tokenUser[0];
    String? user = tokenUser[1];
    Uri pastTransactionUrl = Uri.parse(ApiConstants.devUrl + '/user/$user/transactions');
    final response = await http.get(pastTransactionUrl,
        headers: {
          'Content-Type':'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == HttpStatus.ok) {
      return PastTransactionModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<PayoutResponseModel> fetchPayout(bool all, List tokenUser) async {
    String? token = tokenUser[0];
    String? user = tokenUser[1];
    Uri payoutUrl;
    if (all = true) {
      payoutUrl = Uri.parse(
          ApiConstants.devUrl + '/user/$user/transaction?all=true');
    } else {
      payoutUrl = Uri.parse(
          ApiConstants.devUrl + '/user/$user/transaction?all=false');
    }
    final response = await put(payoutUrl,
        headers: {
          'Content-Type':'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == HttpStatus.ok) {
      return PayoutResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }

  List getUser() {
    String? token = getToken();
    JwtModel jwt = JwtModel.fromJson(JwtParser().parseJwt(token!));
    String? user = jwt.sub;
    return [token, user];
  }
}
