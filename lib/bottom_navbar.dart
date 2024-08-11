// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:practice/core/theme/colors.dart';
import 'package:practice/feature/favourites/favourite_screen.dart';
import 'package:practice/feature/home/home_screen.dart';
import 'package:practice/feature/profile/profile_screen.dart';

class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        height: 60,
        margin: EdgeInsets.only(right: 14, left: 14, bottom: 14),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(
                Icons.favorite_outline,
                color: Colors.white,
              ),
              onPressed: () => _onItemTapped(1),
            ),
            IconButton(
              icon: Icon(
                Icons.person_2_outlined,
                color: Colors.white,
              ),
              onPressed: () => _onItemTapped(2),
            ),
          ],
        ),
      ),
    );
  }
}
