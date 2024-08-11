// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:practice/auth/login_screen.dart';
import 'package:practice/core/theme/colors.dart';
import 'package:practice/feature/home/cart_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(color: buttonColor),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person_3_outlined),
                  radius: 20,
                ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Bon',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'ID: 123456',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Gap(6),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text(
              'About us',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            onTap: () => CartScreen(),
          ),
          Gap(6),
          ListTile(
              leading: Icon(Icons.logout_outlined),
              title: Text(
                'Log out',
                style: TextStyle(
                    fontFamily: 'Lora',
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              }),
        ],
      ),
    );
  }
}
