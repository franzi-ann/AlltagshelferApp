import 'dart:convert';

class User {
  static final Map<String, dynamic> _user = <String, dynamic>{};

  User(Map<String, dynamic> map) {
    _user.addAll(
      map,
    );
  }

  User.fromJSON(String json) {
    _user.addAll(
      jsonDecode(
        json,
      ),
    );
  }

  static bool isLoggedIn() {
    return _user.containsKey("logged_in") && _user["logged_in"];
  }

  static setEmail(String s) => _user["email"] = s;
  static login() => _user["logged_in"] = true;

  static logOut() => _user.remove("logged_in");
}
