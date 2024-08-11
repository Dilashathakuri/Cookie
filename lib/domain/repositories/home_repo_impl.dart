// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:practice/data/model/home_response.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl {
  Future<HomeResponse> fetchProducts() async {
    // final response = await http.get(
    //   Uri.parse('$baseUrl/productList'),
    //   headers: {'Content-Type': 'application/json'},
    // );
    Dio dio = Dio();
    var response = await dio.get(
      'http://192.168.1.73:3002/api/productList',
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );
    print('Response body: ${response.data}');
    if (response.statusCode == 200) {
      return HomeResponse.fromJson(jsonDecode(response.data));
    } else {
      throw Exception('Failed to load products');
    }
  }
}
