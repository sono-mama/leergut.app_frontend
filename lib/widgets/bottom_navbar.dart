import 'package:flutter/cupertino.dart';
import 'package:frontend/pages/home/home_page.dart';
import 'package:frontend/pages/payout/payout_page.dart';

import '../utils/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);


  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int _currentIndex = 0;
  final List _children = [
    HomePage(),
    HomePage(),
    PayoutPage(),
    HomePage()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {

    return CupertinoTabBar(
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
            icon: Icon(CupertinoIcons.person_crop_circle), label: "Profil")
      ],
    );
  }
}

