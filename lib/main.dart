import 'package:flutter/cupertino.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List _children = [
    HomePage(),
    HomePage(),
    PayoutPage(),
    NewsPage()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: AppColors.mainColor),
      home: Scaffold(
          body: Center(
            child: _children[_currentIndex],
          ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        backgroundColor: AppColors.secondaryColor,
        inactiveColor: AppColors.textColor,
        activeColor: AppColors.textBackgroundColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: "Start"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.qrcode_viewfinder), label: "QR-Code"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.money_euro_circle),
              label: "Auszahlen"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.news_solid), label: "News")
        ],
      ),),
    );
  }
}
