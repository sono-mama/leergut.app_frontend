import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/auth/authentication_manager.dart';
import '../../utils/style/colors.dart';
import '../news/news_page.dart';
import '../payout/payout_page.dart';
import '../qrcode/qrcode_page.dart';
import 'home_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentIndex = 0;

  final List _children = [
    const HomePage(),
    const QrCodePage(),
    const PayoutPage(),
    const NewsPage()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();
    return Scaffold(
       appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: [
              IconButton(
                  color: AppColors.textColor,
                  icon: const Icon(Icons.power_settings_new),
                  iconSize: 30.0,
                  onPressed: () {
                    _authManager.logOut();
                  }),
            ]),
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
        ));
  }
}
