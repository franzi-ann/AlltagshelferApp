import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sustain/user/user.dart';
import 'package:sustain/utils/themed_cupertino_widgets.dart';

class LoginPage extends StatefulWidget {
  final Function callback;
  const LoginPage({
    super.key,
    required this.callback,
  });

  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final double _boxWidth = WidgetsBinding
          .instance.platformDispatcher.views.first.physicalSize.width -
      80;

  final formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  bool _loginButtonEnabled = true;

  String? _validateEmail(String? value) {
    if (EmailValidator.validate(
      value!.trim(),
    )) return null;

    return "Ungültige Email Adresse";
  }

  String? _validatePassword(String? value) {
    if (value!.length < 6) {
      return "Ungültiges Passwort";
    }

    return null;
  }

  void _submit() {
    setState(() {
      _loginButtonEnabled = false;
    });
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();

      var map = <String, dynamic>{};
      map["email"] = _email;
      _performLogin(map);
    } else {
      setState(() {
        _loginButtonEnabled = true;
      });
    }
  }

  void _performLogin(Map map) async {
    User.setEmail(map["email"]);
    User.login();
    Navigator.pop(context);
    widget.callback();
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      style: const TextStyle(
        color: Colors.black,
      ),
      obscureText: false,
      keyboardType: TextInputType.emailAddress,
      validator: _validateEmail,
      onSaved: (val) => _email = val,
      decoration: _getDecoration(
        "Email",
      ),
    );
    final passwordField = TextFormField(
      style: const TextStyle(
        color: Colors.black,
      ),
      obscureText: true,
      validator: _validatePassword,
      onSaved: (val) => _password = val,
      decoration: _getDecoration(
        "Passwort",
      ),
    );
    final loginButton = CupertinoButton(
      borderRadius: BorderRadius.circular(
        30,
      ),
      color: Colors.black,
      onPressed: _loginButtonEnabled ? _submit : null,
      child: const Text(
        "Login",
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10.0,
                  ),
                  emailField,
                  const SizedBox(
                    height: 25.0,
                  ),
                  passwordField,
                  const SizedBox(
                    height: 35.0,
                  ),
                  Visibility(
                    visible: _loginButtonEnabled,
                    child: SizedBox(
                      width: _boxWidth,
                      child: loginButton,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 35.0,
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: _loginButtonEnabled
                  ? Container()
                  : ThemedCupertinoWidgets.getProgressIndicator(
                      darkTheme: false,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _getDecoration(String name) {
    return InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(
        20.0,
        15.0,
        20.0,
        15.0,
      ),
      hintText: name,
      hintStyle: const TextStyle(
        color: Colors.black,
      ),
      labelStyle: const TextStyle(
        color: Colors.green,
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            25.0,
          ),
        ),
        borderSide: BorderSide(
          color: Colors.black,
          width: 2.5,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            25.0,
          ),
        ),
        borderSide: BorderSide(
          color: Colors.black,
          width: 2.5,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            25,
          ),
        ),
        borderSide: BorderSide(
          color: Colors.blue,
          width: 2.5,
        ),
      ),
    );
  }
}
