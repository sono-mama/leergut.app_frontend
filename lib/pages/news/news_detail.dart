import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:frontend/pages/news/news_text.dart';
import 'package:frontend/utils/style/colors.dart';
import 'package:frontend/utils/style/dimensions.dart';
import 'package:frontend/widgets/app_icon.dart';

import '../../utils/http/api_service.dart';
import '../../utils/http/news_model.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class NewsDetailPage extends StatefulWidget {
  final String subheading;
  final String heading;
  final String text;
  final Uint8List imageString;

  const NewsDetailPage({Key? key,
    required this.subheading,
    required this.heading,
    required this.text,
    required this.imageString}) : super(key: key);

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                        width: double.maxFinite,
                        height: Dimensions.newsDetailImageHeight,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: MemoryImage(widget.imageString)
                            )
                        )
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
                child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SmallText(text: widget.subheading, color: const Color(0x903C3C3C),),
                          SizedBox(height: Dimensions.newsImageTextBoxSizedBoxHeight),
                          BigText(text: widget.heading,
                            overflow: TextOverflow.fade, maxLines: 10,
                            size: 15, fontWeight: FontWeight.bold,),
                          SizedBox(height: Dimensions.newsImageTextBoxSizedBoxHeight * 1.5),
                          Expanded(
                            child: SingleChildScrollView(
                              child: NewsText(text: widget.text),
                            ),
                          )
                        ],
                      )


              )


              )
        ],
      ),
    );
  }
}
