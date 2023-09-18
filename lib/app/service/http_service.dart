// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/main.dart';

class HttpHelper {
  Future<dynamic> get(
      {required url,
      bool auth = false,
      bool contentHeader = false,
      bool cors = false}) async {
    try {
      Map<String, String> hd =
          await headers(auth: auth, contentHeader: contentHeader, cors: cors);
      if (kDebugMode) {
        print("Passing Url: $url, Passing Headers $hd");
      }

      final response = await http
          .get(Uri.parse(url), headers: hd)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        return http.Response("Timeout", 408);
      });

      if (kDebugMode) {
        print("Status Code On Http Server: ${response.statusCode}");
      }
      if (kDebugMode) {
        print("Body On Http Server: ${response.body}");
      }
      var jsonResponse = returnResponse(response);
      return jsonResponse;
    } catch (e) {
      if (kDebugMode) {
        print("Error or get request failed on http helper $e");
      }
    }
  }

  Future<dynamic> post(
      {required url,
      required body,
      bool auth = false,
      bool contentHeader = false,
      bool cors = false}) async {
    try {
      Map<String, String> hd =
          await headers(auth: auth, contentHeader: contentHeader, cors: cors);
      if (kDebugMode) {
        print("Passing Url: $url, Passing Headers $hd");
      }
      var response = await http
          .post(Uri.parse(url), body: body, headers: hd)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        return http.Response("Timeout", 408);
      });
      if (kDebugMode) {
        print("Status Code On Http Server: ${response.statusCode}");
      }
      if (kDebugMode) {
        print("Body On Http Server: ${response.body}");
      }
      var jsonResponse = returnResponse(response);
      return jsonResponse;
    } catch (e) {
      if (kDebugMode) {
        print("Error or post request failed on http helper $e");
      }
    }
  }

  Future<dynamic> put(
      {required String url,
      required body,
      bool auth = false,
      bool contentHeader = false,
      bool cors = false}) async {
    dynamic responseJson;
    try {
      Map<String, String> hd =
          await headers(auth: auth, contentHeader: contentHeader, cors: cors);
      if (kDebugMode) {
        print("Passing Url: $url, Passing Headers $hd");
      }
      var response = await http
          .put(Uri.parse(url), body: body, headers: hd)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        return http.Response("Timeout", 408);
      });
      if (kDebugMode) {
        print("Status Code On Http Server: ${response.statusCode}");
      }
      if (kDebugMode) {
        print("Body On Http Server: ${response.body}");
      }
      var jsonResponse = returnResponse(response);
      return jsonResponse;
    } catch (e) {
      if (kDebugMode) {
        print("Error or put request failed on http helper $e");
      }
    }
  }

  returnResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        var body = response.body;
        int code = response.statusCode;
        statusCode = code;
        return body;
      case 201:
        var jsonData = response.body;
        var code = response.statusCode;
        return jsonData;
      case 401:
        int code = response.statusCode;
        statusCode = code;
        return code;
      case 408:
        int code = response.statusCode;
        statusCode = code;
        return code;
    }
  }

  headers({auth, contentHeader, cors}) async {
    Map<String, String> headers = {
      HttpHeaders.acceptHeader: "application/json"
    };
    var contentHeaders = {HttpHeaders.contentTypeHeader: "application/json"};
    var corsHeader = {HttpHeaders.accessControlAllowOriginHeader: "*"};
    var corsHeaderTwo = {
      HttpHeaders.accessControlAllowMethodsHeader:
          "GET,PUT,POST,DELETE,PATCH,OPTIONS"
    };
    var corsHeaderThree = {
      HttpHeaders.accessControlAllowCredentialsHeader: "true"
    };
    var corsHeaderFour = {
      HttpHeaders.accessControlAllowHeadersHeader:
          "Origin, Content-Type, Accept"
    };

    if (contentHeader == true) {
      headers.addAll(contentHeaders);
    }
    if (cors == true) {
      headers.addAll(corsHeader);
      headers.addAll(corsHeaderTwo);
      headers.addAll(corsHeaderThree);
      headers.addAll(corsHeaderFour);
    }

    if (auth == true) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var token = preferences.getString("token");
      if (token != null && token.isNotEmpty) {
        headers.addAll({HttpHeaders.authorizationHeader: "Bearer $token"});
      }
    }
    return headers;
  }
}
