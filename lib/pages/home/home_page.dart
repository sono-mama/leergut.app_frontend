import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/home/news_slider.dart';
import 'package:frontend/utils/style/dimensions.dart';
import 'package:frontend/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/auth/authentication_manager.dart';
import '../../utils/style/colors.dart';
import '../news/news_page.dart';
import '../payout/payout_page.dart';
import '../qrcode/qrcode_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();
    return Scaffold(
        /*  appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: [
              IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.power_settings_new),
                  iconSize: 30.0,
                  onPressed: () {
                    _authManager.logOut();
                  }),
            ]),*/
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.only(
                    top: Dimensions.homePageTextContainerTopMargin, bottom: 15),
                padding: EdgeInsets.only(
                    left: Dimensions.widthMargin,
                    right: Dimensions.widthMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                            text: "Hallo, \nMarcello!",
                            color: AppColors.textColor,
                            size: 50,
                            fontWeight: FontWeight.bold)
                      ],
                    ),
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                            text: "Dein aktuelles Pfandguthaben beträgt:",
                            color: AppColors.textColor,
                            size: 16)
                      ],
                    ),
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(top: 5, bottom: 15),
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                            text: "€ 6,20",
                            color: AppColors.textColor,
                            size: 25,
                            fontWeight: FontWeight.bold)
                      ],
                    ),
                  ],
                )),
            const NewsSlider()
          ],
        ),
        );
  }
}
