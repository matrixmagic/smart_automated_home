import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart';

class ApiProvider {
  final String _baseUrl = "http://192.168.43.161:8089/api/";

  Future<Response> get(String url) async {
    try {
      var response = http.get(_baseUrl + url);
      return response;
    } on SocketException {
      throw Exception;
    }
  }

  Future<dynamic> post(String url, dynamic body) async {
    var response;
    response = await http.post(
      _baseUrl + url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(body),
    );

    return response;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
    }
  }
}
