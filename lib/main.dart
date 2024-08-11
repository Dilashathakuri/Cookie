// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:practice/data/view_models/home_viewmodel.dart';
import 'package:practice/data/view_models/login_view_Model.dart';
import 'package:practice/data/view_models/signup_view_model.dart';
import 'package:practice/domain/repositories/auth_repo_impl.dart';
import 'package:practice/domain/repositories/home_repo_impl.dart';
import 'package:practice/domain/repositories/sign_repo_impl.dart';
import 'package:practice/feature/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginViewmodel(authRepoImpl: AuthRepoImpl()),
        ),
        ChangeNotifierProvider(
          create: (_) => SignupViewModel(signupRepoImpl: SignupRepoImpl()),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(homeRepoImpl: HomeRepoImpl()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'http package',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
