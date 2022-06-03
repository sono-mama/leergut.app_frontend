import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/news/news_detail.dart';
import 'package:frontend/pages/news/news_preview.dart';
import 'package:frontend/utils/http/api_service.dart';
import 'package:frontend/utils/http/news_model.dart';
import 'package:frontend/widgets/bottom_navbar.dart';
import 'package:http/http.dart' as http;
import '../../utils/style/colors.dart';
import '../../utils/style/dimensions.dart';
import '../../widgets/big_text.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Future<News>? futureNewsModel;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    futureNewsModel = ApiService().fetchNewsModel("/0/10", http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
          Container(
              margin: const EdgeInsets.only(
                  bottom: 15),
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
            child: FutureBuilder<News>(
                  future: futureNewsModel,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return CupertinoScrollbar(
                        controller: _controller,
                        isAlwaysShown: true,
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: _controller,
                          itemCount: snapshot.data!.numberOfElements,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NewsDetailPage(
                                              heading: snapshot.data!.content[index].heading,
                                              subheading: snapshot.data!.content[index].subHeading,
                                                text: snapshot.data!.content[index].content,
                                                imageString: base64Decode(snapshot.data!.content[index].image)
                                            )));
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: Dimensions.widthMargin,
                                    right: Dimensions.widthMargin,
                                    bottom: Dimensions.heightMargin),
                                child: Row(
                                  children: [
                                    NewsPreview(
                                        type: snapshot
                                            .data!.content[index].subHeading,
                                        headline:
                                            snapshot.data!.content[index].heading,
                                        imageString: base64Decode(
                                            snapshot.data!.content[index].image))
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                )),
        ]),


    );
  }
}
