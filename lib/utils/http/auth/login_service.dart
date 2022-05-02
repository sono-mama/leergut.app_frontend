
import 'package:frontend/utils/http/auth/register_request_model.dart';
import 'package:frontend/utils/http/auth/register_response_model.dart';
import 'package:frontend/utils/http/constants.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import 'login_request_model.dart';
import 'login_response_model.dart';


class LoginService extends GetConnect {
  final String loginUrl = ApiConstants.baseUrl;
  final String registerUrl = ApiConstants.baseUrl + ApiConstants.registerEndpoint;

  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    final response = await post(loginUrl, model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return LoginResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<RegisterResponseModel?> fetchRegister(
      RegisterRequestModel model) async {
    final response = await post(registerUrl, model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return RegisterResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}