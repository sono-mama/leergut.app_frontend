import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/pages/news/news_text.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/dimensions.dart';
import 'package:frontend/widgets/app_icon.dart';

import '../../utils/http/api_service.dart';
import '../../utils/http/news_model.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({Key? key}) : super(key: key);

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {

  Future<News>? futureNewsModel;

  @override
  void initState() {
    super.initState();
    futureNewsModel = ApiService().fetchNewsModel("/0/1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: FutureBuilder<News>(
                future: futureNewsModel,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var img64 = snapshot.data?.content.first.image;
                    final decodedString = base64Decode(img64!);
                    return Container(
                        width: double.maxFinite,
                        height: Dimensions.newsDetailImageHeight,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: MemoryImage(decodedString)
                            )
                        )
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              )),
          Positioned(
              top: Dimensions.newsDetailIconHeightMargin,
              left: Dimensions.widthMargin,
              right: Dimensions.widthMargin,
              child: Row(
                children: const [
                  AppIcon(icon: Icons.arrow_back_ios_new)
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.newsDetailImageHeight - 30,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.widthMargin20,
                    right: Dimensions.widthMargin20, top: Dimensions.heightMargin20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: AppColors.textBackgroundColor
                ),
                child: FutureBuilder<News>(
                  future: futureNewsModel,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SmallText(text: snapshot.data!.content.first.subHeading, color: const Color(0x903C3C3C),),
                          SizedBox(height: Dimensions.newsImageTextBoxSizedBoxHeight),
                          BigText(text: snapshot.data!.content.first.heading,
                            overflow: TextOverflow.fade, maxLines: 10,
                            size: 15, fontWeight: FontWeight.bold,),
                          SizedBox(height: Dimensions.newsImageTextBoxSizedBoxHeight * 1.5),
                          Expanded(
                            child: SingleChildScrollView(
                              child: NewsText(text: snapshot.data!.content.first.content),
                            ),
                          )
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),


              )


              )
        ],
      ),
    );
  }
}
