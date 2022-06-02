import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/payout/deposit_preview.dart';
import 'package:frontend/utils/http/payout_response_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../../utils/http/api_service.dart';
import '../../utils/http/balance_calc.dart';
import '../../utils/http/past_transaction_model.dart';
import '../../utils/style/colors.dart';
import '../../utils/style/dimensions.dart';
import '../../widgets/big_text.dart';
import '../home/base_page.dart';


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
    futurePastTransactionsModel = ApiService().fetchPastTransactions(http.Client(), ApiService().getUser());
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
                                        NumberFormat.simpleCurrency(
                                                locale: 'eu')
                                            .format(BalanceCalc()
                                                .calculateBalance(snapshot
                                                    .data!.transactions))
                                            .toString(),
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
                bottom: Dimensions.heightMargin50),
            child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(primary: AppColors.highlightColor),
              onPressed: () {
                Navigator.of(context).restorablePush(_modalBuilder);
              },
              child: const Text('Jetzt auszahlen'),
            ),
          ),
        ),
      ],
    ));
  }

  static Route<void> _modalBuilder(BuildContext context, Object? arguments) {
    return CupertinoModalPopupRoute<void>(
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text('Was möchtest du auszahlen?'),
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              child: const Text('Alles auszahlen'),
              onPressed: () async {
                final response = await ApiService().fetchPayout(true, ApiService().getUser());

                if (response.status.toString() == "successful") {
                  Get.defaultDialog(
                      title: ":)",
                      middleText: 'Guthaben ausgezahlt!',
                      textConfirm: 'OK',
                      confirmTextColor: AppColors.textBackgroundColor,
                      buttonColor: AppColors.highlightColor,
                      onConfirm: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return const BasePage();
                          }),
                        );
                      });
                } else {
                  debugPrint(response.status);
                  String? error = response.status;
                  Get.defaultDialog(
                      title: ":(",
                      middleText: 'Fehler bei der Übermittlung: $error',
                      textConfirm: 'OK',
                      confirmTextColor: AppColors.textBackgroundColor,
                      buttonColor: AppColors.highlightColor,
                      onConfirm: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return const BasePage();
                          }),
                        );
                      });
                }
                Navigator.pop(context);
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('Den letzten Pfandbon auszahlen'),
              onPressed: () async {
                final response = await ApiService().fetchPayout(false, ApiService().getUser());

                if (response.status.toString() == "successful") {
                  Get.defaultDialog(
                      title: ":)",
                      middleText: 'Guthaben ausgezahlt!',
                      textConfirm: 'OK',
                      confirmTextColor: AppColors.textBackgroundColor,
                      buttonColor: AppColors.highlightColor,
                      onConfirm: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return const BasePage();
                          }),
                        );
                      });
                } else {
                  debugPrint(response.status);
                  String? error = response.status;
                  Get.defaultDialog(
                      title: ":(",
                      middleText: 'Fehler bei der Übermittlung: $error',
                      textConfirm: 'OK',
                      confirmTextColor: AppColors.textBackgroundColor,
                      buttonColor: AppColors.highlightColor,
                      onConfirm: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return const BasePage();
                          }),
                        );
                      });
                }
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
