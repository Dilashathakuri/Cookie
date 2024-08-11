// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:practice/core/theme/strings/strings.dart';
import 'package:practice/data/model/signup_response.dart';

class SignupRepoImpl {
  Future<SignupResponse> signupResponse({
    required String name,
    required String email,
    required String contact,
    required String address,
    required String password,
    required String confirmPassword,
  }) async {
    Dio dio = Dio();
    try {
      final response = await dio.post(
        '$baseUrl/signup',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: jsonEncode({
          'name': name,
          'email': email,
          'phone': contact,
          'address': address,
          'password': password,
          'confirmPassword': confirmPassword,
        }),
      );
      print('Response body: ${response.data}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return SignupResponse.fromjson(jsonDecode(response.data));
      } else {
        throw Exception('Failed to signup');
      }
    } catch (e) {
      print('Error:$e');
      throw Exception('Failed to signup');
    }
  }
}
