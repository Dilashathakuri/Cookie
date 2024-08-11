// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:practice/data/model/login_response.dart';
import 'package:practice/data/repo/auth_repo.dart';
import 'package:practice/domain/repositories/auth_repo_impl.dart';

class LoginViewmodel extends ChangeNotifier {
  final AuthRepoImpl authRepoImpl;
  LoginViewmodel({required this.authRepoImpl});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<LoginResponse> login(AuthRepo authRepo) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await authRepoImpl.loginResponse(
        email: authRepo.email,
        password: authRepo.password,
      );
      notifyListeners();
      _isLoading = false;
      return response;
    } catch (e) {
      notifyListeners();
      _isLoading = false;
      throw Exception(e);
    }
  }
}
