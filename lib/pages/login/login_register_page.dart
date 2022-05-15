import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/utils/style/colors.dart';
import 'package:frontend/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/http/auth/login_view_model.dart';
import '../../utils/style/dimensions.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({Key? key}) : super(key: key);

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final LoginViewModel _viewModel = Get.put(LoginViewModel());

  TextEditingController usernameCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  TextEditingController firstnameCtr = TextEditingController();
  TextEditingController lastnameCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  FormType _formType = FormType.login;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: _formType == FormType.login ? loginForm() : registerForm(),
    ));
  }

  Form loginForm() {
    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      key: formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextFormField(
          controller: usernameCtr,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Benutzername'
                : null;
          },
          decoration: inputDecoration('Benutzername', Icons.person),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Please Enter Password'
                : null;
          },
          controller: passwordCtr,
          decoration: inputDecoration('Passwort', Icons.lock),
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: AppColors.highlightColor
          ),
          onPressed: () async {
            if (formKey.currentState?.validate() ?? false) {
              await _viewModel.loginUser(usernameCtr.text, passwordCtr.text);
            }
          },
          child: const Text('Login'),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _formType = FormType.register;
            });
          },
          child: SmallText(text: 'Noch keinen Account? Jetzt registrieren!', color: AppColors.secondaryColor),
        )
      ]),
    );
  }

  Form registerForm() {
    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      key: formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextFormField(
          controller: usernameCtr,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Bitte Benutzername eingeben'
                : null;
          },
          decoration: inputDecoration('Benutzername', Icons.person),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Bitte Passwort eingeben'
                : null;
          },
          controller: passwordCtr,
          decoration: inputDecoration('Passwort', Icons.lock),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          validator: (value) {
            return (value == null || value.isEmpty || value != passwordCtr.text)
                ? 'Passwörter stimmen nicht überein'
                : null;
          },
          decoration: inputDecoration('Passwort wiederholen', Icons.lock),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: firstnameCtr,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Bitte Vornamen eingeben'
                : null;
          },
          decoration: inputDecoration('Vorname', Icons.person),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: lastnameCtr,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Bitte Nachnamen eingeben'
                : null;
          },
          decoration: inputDecoration('Nachname', Icons.person),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: emailCtr,
          validator: (value) {
            return (value == null || value.isEmpty)
                ? 'Bitte E-Mail Adresse eingeben'
                : null;
          },
          decoration: inputDecoration('E-Mail Adresse', Icons.person),
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: AppColors.highlightColor
          ),
          onPressed: () async {
            if (formKey.currentState?.validate() ?? false) {
              await _viewModel.registerUser(usernameCtr.text, emailCtr.text, firstnameCtr.text, lastnameCtr.text, passwordCtr.text);
            }
          },
          child: const Text('Registrieren'),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _formType = FormType.login;
            });
          },
          child: SmallText(text: 'Zurück zur Anmeldung', color: AppColors.secondaryColor),
        )
      ]),
    );
  }
}

InputDecoration inputDecoration(String labelText, IconData iconData,
    {String? prefix, String? helperText}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    helperText: helperText,
    labelText: labelText,
    labelStyle: TextStyle(color: AppColors.textColor),
    fillColor: AppColors.textBackgroundColor,
    filled: true,
    prefixText: prefix,
    prefixIcon: Icon(
      iconData,
      size: 20,
    ),
    prefixIconConstraints: BoxConstraints(minWidth: 60),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.textBackgroundColor)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.textBackgroundColor)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.textBackgroundColor)),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.textBackgroundColor)),
  );
}

enum FormType { login, register }