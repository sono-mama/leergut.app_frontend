import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/style/colors.dart';
import '../../utils/style/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class DepositPreview extends StatefulWidget {

  final double amount;
  final bool payedOut;


  const DepositPreview({Key? key,
    required this.amount,
    required this.payedOut
  }) : super(key: key);

  @override
  State<DepositPreview> createState() => _DepositPreviewState();
}

class _DepositPreviewState extends State<DepositPreview> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 5),
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
                  child: BigText(text: "Test Supermarkt", size: 15, fontWeight: FontWeight.w500)),
              Container(
                  margin: EdgeInsets.only(top: Dimensions.heightMargin5),
                  child: SmallText(text: NumberFormat.simpleCurrency(locale: 'eu').format(widget.amount).toString(), size: 13, color: const Color(0x903C3C3C),)),
              /*Container(
                  margin: EdgeInsets.only(top: Dimensions.heightMargin5),
                  child: SmallText(text: "23.04.2022", size: 13, color: const Color(0x903C3C3C),)),*/
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
                    widget.payedOut ?  SmallText(text: "ausgezahlt", color: Colors.green.withOpacity(0.7)) : SmallText(text: "nicht ausgezahlt", color: Colors.red.withOpacity(0.7)),

                  ],
                )],
            ),
        ])

    ));
  }
}
