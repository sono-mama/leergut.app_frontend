import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:frontend/widgets/small_text.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: 200),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  //border: Border.all(),
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                          "assets/images/leergut_app_logo_top.png"))),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.textBackgroundColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: Offset(1, 1),
                        color: Colors.grey.withOpacity(0.2))
                  ]),
              margin: EdgeInsets.only(top: 50, left: 30, right: 30),
              child: TextFormField(
                cursorColor: AppColors.secondaryColor,
                decoration: InputDecoration(
                    hintText: "E-Mail-Adresse",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            BorderSide(color: AppColors.textBackgroundColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            BorderSide(color: AppColors.textBackgroundColor)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.textBackgroundColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 7,
                        offset: Offset(1, 1),
                        color: Colors.grey.withOpacity(0.2))
                  ]),
              margin: EdgeInsets.only(top: Dimensions.heightMargin15, left: Dimensions.widthMargin30, right: Dimensions.widthMargin30),
              child: TextFormField(
                obscureText: true,
                cursorColor: AppColors.secondaryColor,
                decoration: InputDecoration(
                    hintText: "Passwort",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            BorderSide(color: AppColors.textBackgroundColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            BorderSide(color: AppColors.textBackgroundColor)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: Container()),
              Container(
                  margin: EdgeInsets.only(right: 30, top: 10),
                  child: SmallText(text: "Passwort vergessen?"))
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.heightMargin50),
              height: Dimensions.loginButtonHeight,
              width: Dimensions.loginButtonWidth,
              decoration: BoxDecoration(
                color: AppColors.highlightColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: BigText(
                    text: "Anmelden",
                    fontWeight: FontWeight.bold,
                    color: AppColors.imageTextColor),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
                margin: EdgeInsets.only(top: Dimensions.heightMargin50),
                child: RichText(
                  text: TextSpan(
                      text: "Noch keinen Account? Jetzt ",
                      style: TextStyle(color: AppColors.textColor),
                      children: [
                        TextSpan(
                            text: "anmelden!",
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold))
                      ]),
                )),
          )
        ],
      ),
    );
  }
}
