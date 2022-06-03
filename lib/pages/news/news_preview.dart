import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

import '../../utils/style/colors.dart';
import '../../utils/style/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class NewsPreview extends StatelessWidget {

  final String type; // News, Partner, Angebot
  final String headline;
  final Uint8List imageString;

  const NewsPreview({Key? key,
    required this.type,
    required this.headline,
    required this.imageString
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: Dimensions.newsPreviewTextBoxWidth,
                margin: EdgeInsets.only(
                    left: (Dimensions.newsImageHeightWidth - 10)),
                height: Dimensions.newsImageTextBoxHeight,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: AppColors.textBackgroundColor),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SmallText(
                        text: type,
                        color: const Color(0x903C3C3C),
                      ),
                      SizedBox(
                          height: Dimensions.newsImageTextBoxSizedBoxHeight),
                      BigText(
                        text: headline,
                        overflow: TextOverflow.fade,
                        maxLines: Dimensions.maxLinesNewsImageTextBox,
                        size: 13,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: Dimensions.newsImageHeightWidth,
            height: Dimensions.newsImageHeightWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.textBackgroundColor,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: MemoryImage(imageString))),
          )
        ],
      ),
    );
  }
}
