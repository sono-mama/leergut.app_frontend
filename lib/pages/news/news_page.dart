import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/news/news_detail.dart';
import 'package:frontend/pages/news/news_preview.dart';
import 'package:frontend/utils/http/api_service.dart';
import 'package:frontend/utils/http/news_model.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Future<News>? futureNewsModel;

  @override
  void initState() {
    super.initState();
    futureNewsModel = ApiService().fetchNewsModel("/0/1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.only(
                    top: Dimensions.headlineTopMargin, bottom: 15),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NewsDetailPage()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.widthMargin,
                            right: Dimensions.widthMargin,
                            bottom: Dimensions.heightMargin),
                        child: Row(
                          children: [
                            FutureBuilder<News>(
                              future: futureNewsModel,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  var img64 = snapshot.data?.content.first.image;
                                  final decodedString = base64Decode(img64!);
                                  return NewsPreview(
                                      type: snapshot.data!.content.first.subHeading,
                                      headline: snapshot.data!.content.first.heading,
                                      imageString: decodedString);
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                return const CircularProgressIndicator();
                              },
                            ),
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
                icon: Icon(CupertinoIcons.home), label: "Start"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.qrcode_viewfinder), label: "QR-Code"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.money_euro_circle),
                label: "Auszahlen"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_crop_circle), label: "Profil")
          ],
        ));
  }
}
