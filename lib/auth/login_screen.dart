// ignore_for_file: prefer_const_declarations, avoid_print, prefer_interpolation_to_compose_strings, use_build_context_synchronously, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, unnecessary_null_comparison

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:practice/auth/forgot_password.dart';
import 'package:practice/auth/signup_screen.dart';
import 'package:practice/bottom_navbar.dart';
import 'package:practice/core/theme/colors.dart';
import 'package:practice/data/repo/auth_repo.dart';
import 'package:practice/data/view_models/login_view_Model.dart';

import 'package:practice/widgets/custom_raised_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordObscured = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Future<void> login(String email, String password) async {
  //   final url = 'http://192.168.1.73:3002/api/login';
  //   Map<String, dynamic> loginResponse = {};

  //   final response = await http.post(
  //     Uri.parse(url),
  //     headers: <String, String>{
  //       "Content-Type": "application/json;charset=UTF-8",
  //     },
  //     body: jsonEncode(<String, String>{
  //       "email": email,
  //       "password": password,
  //     }),
  //   );
  //   print(response.body);
  //   final jsonData = jsonDecode(response.body) as Map<String, dynamic>;

  //   print(response.statusCode.toString());
  //   setState(() {
  //     loginResponse = jsonData;
  //   });

  //   if (response.statusCode == 200) {
  //     final token = loginResponse['token'];
  //     final prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('token', token);

  //     print('prefs: ' + token);
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         backgroundColor: Colors.green,
  //         content: Text(loginResponse["message"].toString())));
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => const HomeScreen()),
  //     );
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         backgroundColor: Colors.red,
  //         content: Text(loginResponse["message"].toString())));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final loginViewmodel = Provider.of<LoginViewmodel>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 60, right: 60, top: 60),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(100),
                Text(
                  'Login to your account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: buttonColor,
                  ),
                ),
                Gap(35),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter Email or username',
                    hintStyle: TextStyle(color: hintColor),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email or username';
                    }
                    return null;
                  },
                ),
                Gap(16),
                TextFormField(
                  obscureText: passwordObscured ? true : false,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordObscured = !passwordObscured;
                        });
                      },
                      icon: Icon(passwordObscured
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    hintStyle: TextStyle(color: hintColor),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
                Gap(6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Gap(2),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword()),
                        );
                      },
                      child: Text('Forgot password?'),
                    ),
                  ],
                ),
                Gap(40),
                loginViewmodel.isLoading
                    ? CircularProgressIndicator()
                    : Center(
                        child: GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              final authRepo = AuthRepo(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim());
                              try {
                                final response =
                                    await loginViewmodel.login(authRepo);
                                if (response.userId != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Colors.green,
                                          content:
                                              Text('${response.message}')));
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BottomNavbar()),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Colors.red,
                                          content:
                                              Text('${response.message}')));
                                }
                              } catch (e) {
                                throw Exception('Failed to login');
                              }
                              // final email = _emailController.text;
                              // final password = _passwordController.text;
                              // login(email, password);
                            }
                          },
                          child: CustomRaisedButton(
                              isButton: true, label: 'Login'),
                        ),
                      ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('or continue with'),
                  ],
                ),
                Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/fb.png'),
                      Gap(12),
                      Image.asset('assets/images/insta.png'),
                      Gap(12),
                      Image.asset('assets/images/twe.png'),
                    ],
                  ),
                ),
                Gap(20),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(text: 'Don\'t have an account? '),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupScreen()),
                              );
                            },
                          text: ' Sign up',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
