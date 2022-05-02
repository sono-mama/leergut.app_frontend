import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/payout/deposit_preview.dart';

import '../../utils/style/colors.dart';
import '../../utils/style/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/bottom_navbar.dart';

class PayoutPage extends StatefulWidget {
  const PayoutPage({Key? key}) : super(key: key);


  @override
  State<PayoutPage> createState() => _PayoutPageState();
}

class _PayoutPageState extends State<PayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.only(
                    top: Dimensions.homePageTextContainerTopMargin,
                    bottom: Dimensions.heightMargin15),
                padding: EdgeInsets.only(
                    left: Dimensions.widthMargin,
                    right: Dimensions.widthMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                            text: "Dein aktuelles\nPfandguthaben beträgt:\n6,20€",
                            maxLines: 3,
                            color: AppColors.textColor,
                            size: 25,
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
                       /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NewsDetailPage()));*/
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.widthMargin,
                            right: Dimensions.widthMargin,
                            bottom: Dimensions.heightMargin),
                        child: Row(
                          children: const [
                            DepositPreview()
                            /*FutureBuilder<News>(
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
                            ),*/
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(
                    top: Dimensions.heightMargin30,
                    bottom: Dimensions.heightMargin30),
                height: Dimensions.loginButtonHeight,
                width: Dimensions.loginButtonWidth,
                decoration: BoxDecoration(
                  color: AppColors.highlightColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: BigText(
                      text: "Jetzt auszahlen",
                      fontWeight: FontWeight.bold,
                      color: AppColors.imageTextColor),
                ),
              ),
            ),
           ],
        )
      );
  }
}
