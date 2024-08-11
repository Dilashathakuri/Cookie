// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:practice/core/theme/strings/strings.dart';
import 'package:practice/data/model/login_response.dart';

class AuthRepoImpl {
  Future<LoginResponse> loginResponse(
      {required String email, required String password}) async {
    Dio dio = Dio();  //post using dio
    try {
      final response = await dio.post(
        '$baseUrl/login',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: jsonEncode({'email': email, 'password': password}),
      );
    //  post acc to http
      // final response = await http.post(
      //   Uri.parse('$baseUrl/login'),
      //   headers: {'Content-Type': 'application/json'},
      //   body: jsonEncode({'email': email, 'password': password}),
      // );
      print('Response body:${response.data}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return LoginResponse.fromjson(jsonDecode(response.data));
      } else {
        throw Exception('failed to login');
      }
    } catch (e) {
      print('Error :$e');
      throw Exception('failed to login');
    }
  }
}
