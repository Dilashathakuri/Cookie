// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:practice/domain/repositories/home_repo_impl.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeRepoImpl homeRepoImpl;
  HomeViewModel({required this.homeRepoImpl});

  List<dynamic> products = [];
  bool isLoading = false;

  Future<void> fetchProducts() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await homeRepoImpl.fetchProducts();
      products = response.products;
      notifyListeners();
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
