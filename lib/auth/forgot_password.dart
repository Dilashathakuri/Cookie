// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:practice/auth/signup_screen.dart';
import 'package:practice/core/theme/colors.dart';
import 'package:practice/widgets/custom_raised_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(100),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Forgot Password',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: buttonColor),
                    ),
                    Gap(35),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter your Email',
                        hintStyle: TextStyle(color: hintColor),
                      ),
                    ),
                    Gap(30),
                    Center(
                        child: CustomRaisedButton(
                            isButton: true, label: 'Continue')),
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
                                        builder: (context) =>
                                            const SignupScreen()));
                              },
                            text: ' Sign up',
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
                    //     Text('dont have an account?'),
                    //     TextButton(
                    //         onPressed: () {
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                 builder: (context) => SignupScreen(),
                    //               ));
                    //         },
                    //         child: Text(
                    //           'Sign Up',
                    //           style: TextStyle(
                    //               decoration: TextDecoration.underline),
                    //         )),
                    //   ],
                    // ),
                    Gap(60),
                  ],
                ),
              ),
            ),
            Image.asset(
              'assets/images/pw.png',
            ),
          ],
        ),
      ),
    );
  }
}
