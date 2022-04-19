import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final genderChoice = ["Herr", "Frau", "Divers"];
  String? value;

  DateTime? dateTime = DateTime.now();
  var outputFormat = DateFormat("dd.MM.yyyy");

  TextEditingController dateCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: Dimensions.heightMargin50,
                  right: Dimensions.widthMargin20),
              alignment: Alignment.topRight,
              child: const AppIcon(icon: Icons.close),
            ),
            Container(
                margin: EdgeInsets.only(
                    top: Dimensions.heightMargin20,
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
                            text: "Jetzt registrieren!",
                            color: AppColors.textColor,
                            size: 35,
                            fontWeight: FontWeight.bold)
                      ],
                    ),
                  ],
                )),
            Align(
                alignment: Alignment.center,
                child: Container(
                  height: Dimensions.signUpPageTextFieldHeight,
                  decoration: BoxDecoration(
                      color: AppColors.textBackgroundColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: const Offset(1, 1),
                            color: Colors.grey.withOpacity(0.2))
                      ]),
                  margin: EdgeInsets.only(
                      top: Dimensions.heightMargin50,
                      left: Dimensions.widthMargin30,
                      right: Dimensions.widthMargin30),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        value: value,
                        iconSize: 28,
                        icon: Icon(Icons.arrow_drop_down,
                            color: AppColors.textColor),
                        isExpanded: true,
                        hint: const Text("Anrede"),
                        items: genderChoice.map(buildMenuItem).toList(),
                        onChanged: (value) =>
                            setState(() => this.value = value)),
                  ),
                )),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: Dimensions.signUpPageTextFieldHeight,
                decoration: BoxDecoration(
                    color: AppColors.textBackgroundColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                margin: EdgeInsets.only(
                    top: Dimensions.heightMargin15,
                    left: Dimensions.widthMargin30,
                    right: Dimensions.widthMargin30),
                child: TextFormField(
                  cursorColor: AppColors.secondaryColor,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(left: Dimensions.widthMargin20),
                      hintText: "Nachname",
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
                height: Dimensions.signUpPageTextFieldHeight,
                decoration: BoxDecoration(
                    color: AppColors.textBackgroundColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                margin: EdgeInsets.only(
                    top: Dimensions.heightMargin15,
                    left: Dimensions.widthMargin30,
                    right: Dimensions.widthMargin30),
                child: TextFormField(
                  cursorColor: AppColors.secondaryColor,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(left: Dimensions.widthMargin20),
                      hintText: "Vorname",
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
                height: Dimensions.signUpPageTextFieldHeight,
                decoration: BoxDecoration(
                    color: AppColors.textBackgroundColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                margin: EdgeInsets.only(
                    top: Dimensions.heightMargin15,
                    left: Dimensions.widthMargin30,
                    right: Dimensions.widthMargin30),
                child: TextFormField(
                  controller: dateCtl,
                  readOnly: true,
                  onTap: datePicker,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(left: Dimensions.widthMargin20),
                      hintText: "Geburtsdatum",
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
                height: Dimensions.signUpPageTextFieldHeight,
                decoration: BoxDecoration(
                    color: AppColors.textBackgroundColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                margin: EdgeInsets.only(
                    top: Dimensions.heightMargin15,
                    left: Dimensions.widthMargin30,
                    right: Dimensions.widthMargin30),
                child: TextFormField(
                  cursorColor: AppColors.secondaryColor,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(left: Dimensions.widthMargin20),
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
                height: Dimensions.signUpPageTextFieldHeight,
                decoration: BoxDecoration(
                    color: AppColors.textBackgroundColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                margin: EdgeInsets.only(
                    top: Dimensions.heightMargin15,
                    left: Dimensions.widthMargin30,
                    right: Dimensions.widthMargin30),
                child: TextFormField(
                  obscureText: true,
                  cursorColor: AppColors.secondaryColor,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(left: Dimensions.widthMargin20),
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
                      text: "Registrieren",
                      fontWeight: FontWeight.bold,
                      color: AppColors.imageTextColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));

  datePicker() async {
    await showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
              alignment: Alignment.center,
              height: 270,
              color: AppColors.textBackgroundColor,
              child: Column(children: [
                SizedBox(
                  height: 250,
                  child: CupertinoDatePicker(
                    initialDateTime: dateTime,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (dateTime) {
                      setState(() {
                        dateCtl.text =
                            (outputFormat.format(dateTime)).toString();
                      });
                    },
                  ),
                ),
              ]),
            ));
  }
}
