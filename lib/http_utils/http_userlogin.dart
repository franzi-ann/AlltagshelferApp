import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpUserLogin {
  Future<HttpUserLoginResponse> doLogin(Map body) async {
    const String url = "";
    HttpUserLoginResponse userLoginResponse = HttpUserLoginResponse();

    try {
      http.Response responseData = await http
          .post(
            Uri.parse(
              url,
            ),
            body: body,
          )
          .timeout(
            const Duration(
              milliseconds: 5000,
            ),
          );

      userLoginResponse = _buildResponse(
        responseData,
      );
    } on Exception catch (_) {
      userLoginResponse.setStatus(600);
    } on Error catch (_) {
      userLoginResponse.setStatus(600);
    }
    return userLoginResponse;
  }

  HttpUserLoginResponse _buildResponse(http.Response responseData) {
    HttpUserLoginResponse userLoginResponse = HttpUserLoginResponse();
    if (responseData.statusCode == 200) {
      var jsonResponse = json.decode(responseData.body);
      userLoginResponse.setJson(
        responseData.body,
      );
      userLoginResponse.setToken(jsonResponse["token"]);
      userLoginResponse.setStatus(200);
    } else if (responseData.statusCode == 400 ||
        responseData.statusCode == 401) {
      userLoginResponse.setStatus(401);
    } else {
      userLoginResponse.setStatus(500);
    }

    return userLoginResponse;
  }
}

class HttpUserLoginResponse {
  String? _token;
  int _status = 0;
  String? _json;

  HttpUserLoginResponse();

  void setJson(String json) {
    _json = json;
  }

  String? getJson() {
    return _json;
  }

  void setToken(String? token) {
    _token = token;
  }

  String? getToken() {
    return _token;
  }

  void setStatus(int status) {
    _status = status;
  }

  int getStatus() {
    return _status;
  }
}
