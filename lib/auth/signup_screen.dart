// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, body_might_complete_normally_nullable, unnecessary_string_interpolations, use_build_context_synchronously, avoid_print, sort_child_properties_last

import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
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

  File? _image;
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    } else {
      print('No image selected');
    }
  }

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
                    hintText: 'Confirm Password',
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
                Gap(16),
                ElevatedButton(
                  onPressed: () {
                    _image == null
                        ? _pickImage()
                        : showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                child: Dialog(
                                    shape: Border.all(),
                                    child: Image.file(
                                      _image!,
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    )),
                                width: 300,
                                height: 300,
                              );
                            });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          _image != null ? 'profile image' : 'upload an image'),
                      IconButton(
                        onPressed: () {
                          if (_image != null) ;
                          setState(() {
                            _image = null;
                          });
                        },
                        icon: Icon(
                          _image != null ? Icons.close : Icons.image,
                        ),
                      ),
                    ],
                  ),
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
                                    confirmPasswordController.text.trim(),
                              );
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
                            }
                          },
                          child: GestureDetector(
                            onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            ),
                            child: CustomRaisedButton(
                              isButton: true,
                              label: 'Sign up',
                            ),
                          ),
                        ),
                      ),
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
                                  builder: (context) => const SignupScreen(),
                                ),
                              );
                            },
                          text: ' Login',
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
