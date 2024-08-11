import 'package:flutter/material.dart';

import 'package:practice/data/model/signup_response.dart';
import 'package:practice/data/repo/sign_repo.dart';
import 'package:practice/domain/repositories/sign_repo_impl.dart';

class SignupViewModel extends ChangeNotifier {
  final SignupRepoImpl signupRepoImpl;
  SignupViewModel({required this.signupRepoImpl});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<SignupResponse> signup(SignupRepo signRepo) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await signupRepoImpl.signupResponse(
          name: signRepo.name,
          email: signRepo.email,
          contact: signRepo.contact,
          address: signRepo.address,
          password: signRepo.password,
          confirmPassword: signRepo.confirmPassword);
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
