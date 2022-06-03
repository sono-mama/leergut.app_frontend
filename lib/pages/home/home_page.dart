import 'package:flutter/material.dart';
import 'package:frontend/pages/home/news_slider.dart';
import 'package:frontend/utils/style/dimensions.dart';
import 'package:frontend/widgets/big_text.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../utils/http/api_service.dart';
import '../../utils/http/auth/user_model.dart';
import '../../utils/http/balance_calc.dart';
import '../../utils/http/past_transaction_model.dart';
import '../../utils/style/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<UserModel>? futureUserModel;
  Future<PastTransactionModel>? futurePastTransactionsModel;

  @override
  void initState() {
    super.initState();
    futureUserModel = ApiService().fetchUser(http.Client(), ApiService().getUser());
    futurePastTransactionsModel = ApiService().fetchPastTransactions(http.Client(), ApiService().getUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: [
              IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.power_settings_new),
                  iconSize: 30.0,
                  onPressed: () {
                    _authManager.logOut();
                  }),
            ]),*/
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(
                  top: Dimensions.homePageTextContainerTopMargin, bottom: 15),
              padding: EdgeInsets.only(
                  left: Dimensions.widthMargin, right: Dimensions.widthMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      FutureBuilder<UserModel>(
                          future: futureUserModel,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return BigText(
                                  text: "Hallo, \n" + snapshot.data!.firstName,
                                  color: AppColors.textColor,
                                  size: 50,
                                  fontWeight: FontWeight.bold);
                            } else if (snapshot.hasError) {
                              return BigText(
                                  text: "Hallo, \ndu! ",
                                  color: AppColors.textColor,
                                  size: 50,
                                  fontWeight: FontWeight.bold);
                            }
                            return const CircularProgressIndicator();
                          })
                    ],
                  ),
                ],
              )),
          Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                          text: "Dein aktuelles Pfandguthaben beträgt:",
                          color: AppColors.textColor,
                          size: 16)
                    ],
                  ),
                ],
              )),
          Container(
              margin: const EdgeInsets.only(top: 5, bottom: 15),
              padding: const EdgeInsets.only(left: 20, right: 20),
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
                                  text: NumberFormat.simpleCurrency(locale: 'eu').format(BalanceCalc().calculateBalance(snapshot.data!.transactions)).toString(),
                                  color: AppColors.textColor,
                                  size: 25,
                                  fontWeight: FontWeight.bold);
                            } else if (snapshot.hasError) {
                              return BigText(
                                  text: "€ ??",
                                  color: AppColors.textColor,
                                  size: 25,
                                  fontWeight: FontWeight.bold);
                            }
                            return const CircularProgressIndicator();
                          })
                    ],
                  ),
                ],
              )),
          const NewsSlider()
        ],
      ),
    );
  }
}
