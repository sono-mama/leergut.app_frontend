import 'package:flutter/material.dart';
import 'package:frontend/pages/home/home_page.dart';
import 'package:frontend/pages/login/login_page.dart';
import 'package:frontend/pages/login/signup_page.dart';
import 'package:frontend/pages/news/news_detail.dart';
import 'package:frontend/pages/news/news_page.dart';
import 'package:frontend/pages/payout/deposit_preview.dart';
import 'package:frontend/pages/payout/payout_page.dart';
import 'package:frontend/utils/colors.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: AppColors.mainColor),
      home: SignUpPage(),
    );
  }
}
