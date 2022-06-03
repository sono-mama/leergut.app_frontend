import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/utils/http/api_service.dart';
import 'package:frontend/utils/http/news_model.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('fetchNewsModel', () {
    test('returns NewsModel when http response is successful', () async {
      // Mock the API call to return a json response with http status 200 Ok //
      final mockHTTPClient = MockClient((request) async {
        // Create sample response of the HTTP call //
        final response = {
          "content": [
            {
              "id": 2,
              "heading": "Testheading",
              "subHeading": "TestsubHeading",
              "content": "Lorem Ipsum",
              "image": "",
              "author": "admin",
              "insertDate": "2022-04-20T09:27:21.715614"
            }
          ],
          "pageable": {
            "sort": {"empty": false, "unsorted": false, "sorted": true},
            "offset": 0,
            "pageNumber": 0,
            "pageSize": 1,
            "paged": true,
            "unpaged": false
          },
          "totalPages": 2,
          "totalElements": 2,
          "last": false,
          "size": 1,
          "number": 0,
          "sort": {"empty": false, "unsorted": false, "sorted": true},
          "numberOfElements": 1,
          "first": true,
          "empty": false
        };
        return Response(jsonEncode(response), 200);
      });
      expect(await ApiService().fetchNewsModel("/0/1", mockHTTPClient),
          isA<News>());
    });

    test('return error message when http response is unsuccessful', () async {
      // Mock the API call to return an
      // empty json response with http status 404
      final mockHTTPClient = MockClient((request) async {
        final response = {};
        return Response(jsonEncode(response), 404);
      });
      expect(() async => await ApiService().fetchNewsModel("/0/1", mockHTTPClient), throwsException);
    });
  });
}
