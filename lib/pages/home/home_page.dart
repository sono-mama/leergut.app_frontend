import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/home/news_slider.dart';
import 'package:frontend/utils/dimensions.dart';
import 'package:frontend/widgets/big_text.dart';

import '../../utils/colors.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void onTapNav(int index) {


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: Dimensions.homePageTextContainerTopMargin, bottom: 15),
              padding: EdgeInsets.only(left: Dimensions.widthMargin, right: Dimensions.widthMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                    BigText(text: "Hallo, \nMarcello!",
                        color: AppColors.textColor,
                        size: 50,
                        fontWeight: FontWeight.bold)
                    ],
                  ),
                ],
              )
          ),
          Container(
              /*decoration: BoxDecoration(
                  border: Border.all()
              ),*/
              margin: const EdgeInsets.only(top:20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Dein aktuelles Pfandguthaben beträgt:",
                          color: AppColors.textColor,
                          size: 16)
                    ],
                  ),
                ],
              )
          ),
          Container(
             /* decoration: BoxDecoration(
                  border: Border.all()
              ),*/
              margin: const EdgeInsets.only(top:5, bottom: 15),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "€ 6,20",
                          color: AppColors.textColor,
                          size: 25,
                          fontWeight: FontWeight.bold)
                    ],
                  ),
                ],
              )
          ),
          const NewsSlider()
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: AppColors.secondaryColor,
        inactiveColor: AppColors.textColor,
        activeColor: AppColors.textBackgroundColor,
        onTap: onTapNav,
        items: const [
           BottomNavigationBarItem(
               icon: Icon(CupertinoIcons.home),
             label: "Start"
           ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.qrcode_viewfinder),
              label: "QR-Code"
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.money_euro_circle),
              label: "Auszahlen"
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_crop_circle),
              label: "Profil"
          )
        ],
      )
    );
  }
}