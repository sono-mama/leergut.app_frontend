import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/style/colors.dart';
import '../../utils/style/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class DepositPreview extends StatefulWidget {
  const DepositPreview({Key? key}) : super(key: key);

  @override
  State<DepositPreview> createState() => _DepositPreviewState();
}

class _DepositPreviewState extends State<DepositPreview> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 5),
        margin: EdgeInsets.only(bottom: Dimensions.heightMargin15),
        height: Dimensions.depositPreviewHeight,
        width: Dimensions.depositPreviewWidth,
        constraints: const BoxConstraints(
          minHeight: 80
        ),
        decoration: BoxDecoration(
          color: AppColors.textBackgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: Dimensions.heightMargin15,
                    right: Dimensions.widthMargin30),
                  child: BigText(text: "Supermarkt 1", size: 15, fontWeight: FontWeight.w500)),
              Container(
                  margin: EdgeInsets.only(top: Dimensions.heightMargin5),
                  child: SmallText(text: "€ 1,20", size: 13, color: const Color(0x903C3C3C),)),
              Container(
                  margin: EdgeInsets.only(top: Dimensions.heightMargin5),
                  child: SmallText(text: "23.04.2022", size: 13, color: const Color(0x903C3C3C),)),
            ],
          ),
            const SizedBox(
              width: 0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SmallText(text: "ausgezahlt", color: Colors.green.withOpacity(0.7)),
                    const AppIcon(icon: Icons.arrow_forward_ios),
                  ],
                )],
            ),
        ])

    ));
  }
}
