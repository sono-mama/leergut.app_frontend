import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/news/news_detail.dart';
import 'package:frontend/pages/news/news_preview.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
            margin:
                EdgeInsets.only(top: Dimensions.headlineTopMargin, bottom: 15),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                        text: "News & Angebote",
                        color: AppColors.textColor,
                        size: 30,
                        fontWeight: FontWeight.bold)
                  ],
                ),
              ],
            )),
        Flexible(
          child: CupertinoScrollbar(
            isAlwaysShown: true,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NewsDetailPage()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.widthMargin,
                        right: Dimensions.widthMargin,
                        bottom: Dimensions.heightMargin),
                    child: Row(
                      children: const [
                       NewsPreview(type: "News", headline: "Jetzt deutschlandweit in allen Rewe-Märken"
                           " mit der leergut.app dein Pfand abgeben und mit Guthaben bezahlen", imageUrl: "assets/images/Rewe_logo.png")
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    ),
        bottomNavigationBar: CupertinoTabBar(
          backgroundColor: AppColors.secondaryColor,
          inactiveColor: AppColors.textColor,
          activeColor: AppColors.textBackgroundColor,
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
        ));
  }
}
