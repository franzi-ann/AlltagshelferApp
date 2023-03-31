import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpRestClient {
  String url;
  Map<String, String>? headers;
  int timeout;

  HttpRestClient({
    required this.url,
    this.headers,
    this.timeout = 5000,
  });

  Future<HttpResponse> call() async {
    HttpResponse response;
    try {
      http.Response responseData = await http
          .get(
            Uri.parse(
              url,
            ),
            headers: headers,
          )
          .timeout(
            Duration(
              milliseconds: timeout,
            ),
          );
      if (responseData.statusCode == 200) {
        response = HttpResponse(
          false,
          jsonDecode(
            responseData.body,
          ),
        );
      } else {
        response = HttpResponse(
          true,
          "Status was not 200",
        );
      }
    } on Exception catch (_) {
      response = HttpResponse(
        true,
        _.toString(),
      );
    } on Error catch (_) {
      response = HttpResponse(
        true,
        _.stackTrace.toString(),
      );
    }

    return response;
  }
}

class HttpResponse {
  bool isError;
  dynamic body;

  HttpResponse(
    this.isError,
    this.body,
  );
}
