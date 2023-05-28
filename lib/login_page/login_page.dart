import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sustain/http_utils/http_userlogin.dart';
import 'package:sustain/utils/themed_cupertino_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
      map["password"] = _password;
      _performLogin(map);
    } else {
      setState(() {
        _loginButtonEnabled = true;
      });
    }
  }

  void _performLogin(Map map) {
    Future<HttpUserLoginResponse> response = HttpUserLogin().doLogin(map);
    response.then((httpUserLogin) {
      _evaluteLoginResponse(httpUserLogin);
    });
  }

  void _evaluteLoginResponse(HttpUserLoginResponse httpUserLogin) {
    if (httpUserLogin.getStatus() == 200) {
      loginSuccess(httpUserLogin);
    } else {
      if (httpUserLogin.getStatus() == 400 ||
          httpUserLogin.getStatus() == 401) {
        Fluttertoast.showToast(
          msg: "Login fehlerhaft",
        );
      } else if (httpUserLogin.getStatus() == 500) {
        Fluttertoast.showToast(
          msg: "Serverfehler",
        );
      } else {
        Fluttertoast.showToast(
          msg: "Keine Verbindung zum Server möglich",
        );
      }
      setState(() {
        _loginButtonEnabled = true;
      });
    }
  }

  Future<void> loginSuccess(HttpUserLoginResponse httpUserLoginResponse) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", httpUserLoginResponse.getJson()!);
    prefs.setString("token", httpUserLoginResponse.getToken()!);
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
