import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/payout/deposit_preview.dart';
import 'package:intl/intl.dart';

import '../../utils/http/api_service.dart';
import '../../utils/http/balance_calc.dart';
import '../../utils/http/past_transaction_model.dart';
import '../../utils/style/colors.dart';
import '../../utils/style/dimensions.dart';
import '../../widgets/big_text.dart';

class PayoutPage extends StatefulWidget {
  const PayoutPage({Key? key}) : super(key: key);

  @override
  State<PayoutPage> createState() => _PayoutPageState();
}

class _PayoutPageState extends State<PayoutPage> {
  Future<PastTransactionModel>? futurePastTransactionsModel;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    futurePastTransactionsModel = ApiService().fetchPastTransactions();
  }

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
                left: Dimensions.widthMargin, right: Dimensions.widthMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    FutureBuilder<PastTransactionModel>(
                        future: futurePastTransactionsModel,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return BigText(
                                text:
                                    "Dein aktuelles\nPfandguthaben beträgt:\n" +
                                        NumberFormat.simpleCurrency(locale: 'eu').format(BalanceCalc().calculateBalance(snapshot.data!.transactions)).toString(),
                                maxLines: 3,
                                color: AppColors.textColor,
                                size: 25,
                                fontWeight: FontWeight.bold);
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          return const CircularProgressIndicator();
                        })
                  ],
                ),
              ],
            )),
        Flexible(
            child: FutureBuilder<PastTransactionModel>(
          future: futurePastTransactionsModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CupertinoScrollbar(
                controller: _controller,
                isAlwaysShown: true,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: _controller,
                  itemCount: snapshot.data!.transactions.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.widthMargin,
                          right: Dimensions.widthMargin,
                          bottom: Dimensions.heightMargin),
                      child: Row(
                        children: [
                          DepositPreview(
                            amount: snapshot.data!.transactions[index].amount,
                            payedOut:
                                snapshot.data!.transactions[index].payedOut,
                          )
                        ],
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
    ));
  }
}
