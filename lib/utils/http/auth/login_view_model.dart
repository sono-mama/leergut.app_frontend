import 'package:flutter/material.dart';
import 'package:frontend/utils/http/auth/register_request_model.dart';
import 'package:frontend/utils/style/colors.dart';
import 'package:get/get.dart';

import '../../auth/authentication_manager.dart';
import 'login_request_model.dart';
import 'login_service.dart';

class LoginViewModel extends GetxController {
  late final LoginService _loginService;
  late final AuthenticationManager _authManager;

  @override
  void onInit() {
    super.onInit();
    _loginService = Get.put(LoginService());
    _authManager = Get.find();
  }

  Future<void> loginUser(String username, String password) async {
    final response = await _loginService
        .fetchLogin(LoginRequestModel(username: username, password: password));

    if (response != null) {
      /// Set isLogin to true
      _authManager.login(response.token);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          title: ":(",
          middleText: 'Benutzername oder Passwort falsch',
          textConfirm: 'OK',
          buttonColor: AppColors.highlightColor,
          confirmTextColor: AppColors.textBackgroundColor,
          onConfirm: () {
            Get.back();
          });
    }
  }

  Future<void> registerUser(String username, String email, String firstname,
      String lastname, String password,) async {
    final response = await _loginService
        .fetchRegister(RegisterRequestModel(username: username, email: email,
        firstname: firstname, lastname: lastname, password: password));

    if (response?.status.toString() == "Success") {
      print(response?.status);
      Get.defaultDialog(
          title: ":)",
          middleText: 'Erfolgreich registriert!',
          textConfirm: 'OK',
          confirmTextColor: AppColors.textBackgroundColor,
          buttonColor: AppColors.highlightColor,
          onConfirm: () {
            Get.back();
          });
      /// Set isLogin to true
      //_authManager.login(response.token);
    } else {
      print(response?.status);
      /// Show user a dialog about the error response
      Get.defaultDialog(
          title: ":(",
          middleText: 'Fehler bei der Registrierung. Bitte erneut versuchen!',
          textConfirm: 'OK',
          confirmTextColor: AppColors.textBackgroundColor,
          buttonColor: AppColors.highlightColor,
          onConfirm: () {
            Get.back();
          });
    }
  }
}