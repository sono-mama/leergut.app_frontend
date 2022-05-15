import 'package:flutter/cupertino.dart';
import 'package:frontend/pages/login/login_register_page.dart';
import 'package:get/get.dart';

import '../../pages/home/base_page.dart';
import 'authentication_manager.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();

    return Obx(() {
      return _authManager.isLogged.value ? const BasePage() : const LoginRegisterPage();
    });
  }
}