import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/utils/http/api_service.dart';
import 'package:frontend/utils/http/auth/user_model.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('fetchUserModel', () {
    test('returns UserModel when http response is successful', () async {
      // Mock the API call to return a json response with http status 200 Ok //
      final mockHTTPClient = MockClient((request) async {
        // Create sample response of the HTTP call //
        final response = {
          "id": 1,
          "firstName": "testname",
          "lastName": "testlastname",
          "username": "testname5",
          "email": "my@e.mail",
          "appUserRole": "USER",
        };
        return Response(jsonEncode(response), 200);
      });
      expect(await ApiService().fetchUser(mockHTTPClient, ["testname5", "test"]),
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
          () async =>
              await ApiService().fetchUser(mockHTTPClient, ["a", "test"]),
          throwsException);
    });
  });
}
