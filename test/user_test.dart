import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/utils/http/api_service.dart';
import 'package:frontend/utils/http/auth/user_model.dart';
import 'package:frontend/utils/http/past_transaction_model.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('fetchUserModel', () {
    test('returns UserModel when http response is successful',
            () async {
          // Mock the API call to return a json response with http status 200 Ok //
          final mockHTTPClient = MockClient((request) async {
            // Create sample response of the HTTP call //
            final response = {
              "id": 8,
              "firstName": "Max",
              "lastName": "Mustermann",
              "username": "a",
              "email": "a",
              "appUserRole": "USER",
              "transactions": [
                {
                  "id": "43771f34-06b5-4e2d-b83f-56057c564567",
                  "amount": 10.5,
                  "correspondingTransaction":
                  "377003fa-7ffe-4349-b69f-788907c403a4",
                  "payedOut": true,
                  "sequenceNumber": 4
                },
                {
                  "id": "aab240ad-b92d-4075-8326-bc5e0499984e",
                  "amount": 16.5,
                  "correspondingTransaction":
                  "2ad51668-9d43-4649-84a1-c9941f26623b",
                  "payedOut": true,
                  "sequenceNumber": 3
                },
                {
                  "id": "8ed74275-dc3e-426f-ac74-69bd5d5243ed",
                  "amount": 7.95,
                  "correspondingTransaction":
                  "ca45c67b-7f02-4979-8850-371dc30d9aec",
                  "payedOut": true,
                  "sequenceNumber": 2
                }
              ]
            };
            return Response(jsonEncode(response), 200);
          });
          // Check whether getNumberTrivia function returns
          // number trivia which will be a String
          expect(await ApiService().fetchUser(mockHTTPClient, ["a", "test"]),
              isA<UserModel>());
        });

    test('return error message when http response is unsuccessful', () async {
      // Mock the API call to return an
      // empty json response with http status 404
      final mockHTTPClient = MockClient((request) async {
        final response = {};
        return Response(jsonEncode(response), 404);
      });
      expect(
              () async => await ApiService().fetchUser(mockHTTPClient, ["a", "test"]),
          throwsException);
    });
  });
}
