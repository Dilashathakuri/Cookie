// ignore_for_file: prefer_const_constructors, prefer_const_declarations, avoid_print, use_build_context_synchronously, body_might_complete_normally_nullable, unnecessary_null_comparison, unnecessary_string_interpolations

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:practice/auth/login_screen.dart';
import 'package:practice/core/theme/colors.dart';
import 'package:practice/data/repo/sign_repo.dart';
import 'package:practice/data/view_models/signup_view_model.dart';
import 'package:practice/widgets/custom_raised_button.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool passwordObscured = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // final url = "http://192.168.1.66:3002/api/signup";

  // Future<void> signup(String name, String email, String contact,
  //     String address, String password, String confirmPassword) async {
  //   final response = await http.post(Uri.parse(url),
  //       headers: <String, String>{
  //         "Content-Type": "application/json;charset=UTF-8",
  //       },
  //       body: jsonEncode(<String, String>{
  //         "name": name,
  //         "email": email,
  //         "phone": contact,
  //         "address": address,
  //         "password": password,
  //         "confirmPassword": confirmPassword,
  //       }));

  //   print(response.body);
  //   print(response.statusCode.toString());
  //   if (response.statusCode == 201) {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       backgroundColor: Colors.green,
  //       content: Text("Signup successfull"),
  //     ));
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => const LoginScreen()),
  //     );
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    final signupViewModel = Provider.of<SignupViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(50),
                Text(
                  'Create account',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: buttonColor),
                ),
                Gap(26),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                    hintStyle: TextStyle(color: hintColor),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Email';
                    }
                  },
                ),
                Gap(16),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter Username',
                    hintStyle: TextStyle(color: hintColor),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your username';
                    }
                  },
                ),
                Gap(16),
                TextFormField(
                  controller: contactController,
                  decoration: InputDecoration(
                    hintText: 'Enter Contact number',
                    hintStyle: TextStyle(color: hintColor),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Contact number';
                    }
                  },
                ),
                Gap(16),
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    hintText: 'Enter location',
                    hintStyle: TextStyle(color: hintColor),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Location';
                    }
                  },
                ),
                Gap(16),
                TextFormField(
                  obscureText: passwordObscured ? true : false,
                  controller: passwordController,
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
                      return 'Please Enter Your Password';
                    }
                  },
                ),
                Gap(16),
                TextFormField(
                  obscureText: passwordObscured ? true : false,
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    hintText: 'confirm Password',
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
                      return 'Please Confirm Your Password';
                    }
                  },
                ),
                Gap(50),
                signupViewModel.isLoading
                    ? CircularProgressIndicator()
                    : Center(
                        child: GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                final signupRepo = SignupRepo(
                                    name: nameController.text.trim(),
                                    email: emailController.text.trim(),
                                    contact: contactController.text.trim(),
                                    address: addressController.text.trim(),
                                    password: passwordController.text.trim(),
                                    confirmPassword:
                                        confirmPasswordController.text.trim());
                                try {
                                  final response =
                                      await signupViewModel.signup(signupRepo);
                                  if (response.message != null) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Text('${response.message}'),
                                    ));
                                  }
                                } catch (e) {
                                  throw Exception('Failed to signup');
                                }

                                // final name = nameController.text;
                                // final email = emailController.text;
                                // final contact = contactController.text;
                                // final address = addressController.text;

                                // final password = passwordController.text;
                                // final confirmPassword =
                                //     confirmPasswordController.text;
                                // signup(name, email, contact, address, password,
                                //     confirmPassword);
                              }
                            },
                            child: GestureDetector(
                              onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen())),
                              child: CustomRaisedButton(
                                  isButton: true, label: 'Sign up'),
                            ))),
                Gap(20),
                Center(
                  child: RichText(
                      text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(text: 'Already have an account? '),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignupScreen()));
                          },
                        text: ' Login',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text('Already have an account?'),
                //     TextButton(
                //         onPressed: () {
                //           Navigator.pushReplacement(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => LoginScreen()));
                //         },
                //         child: Text(
                //           'login',
                //           style: TextStyle(decoration: TextDecoration.underline),
                //         ))
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
