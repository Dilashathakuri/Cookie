// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:practice/core/theme/colors.dart';
import 'package:practice/feature/profile/profile_screen.dart';


class EditUserProfile extends StatefulWidget {
  const EditUserProfile({super.key});

  @override
  State<EditUserProfile> createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: buttonColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfileScreen())),
        ),
        title: Center(
          child: Text(
            'Edit Profile Picture',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: buttonColor,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/prof.png'),
                  ),
                ],
              ),
            ),
            Gap(24),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildTextField('Name', 'Add name', nameController),
                    _buildTextField(
                        'Username', 'Change username', usernameController),
                    _buildTextField(
                        'Location', 'Add location', locationController),
                    _buildTextField('Email', 'Change email', emailController),
                    _buildTextField(
                        'Contact', 'Change contact number', contactController),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Container(
            width: 80,
            child: Text(
              label,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: hint, hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
        ],
      ),
    );
  }
}
