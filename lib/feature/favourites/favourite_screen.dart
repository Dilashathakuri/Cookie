// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:practice/core/theme/colors.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favourites',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
              ),
            ],
          ),
          width: 210,
          height: 278,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ],
              ),
              Center(
                child: Image.asset(
                  'assets/images/bis.png',
                  height: 100,
                ),
              ),
              Center(
                  child: Image.asset(
                'assets/images/shadow.png',
              )),
              Text(
                'Cookie',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '10% brown sugar',
              ),
              Gap(6),
              Padding(
                padding: const EdgeInsets.all(2),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(248, 248, 248, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 176,
                  height: 46,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ 3.00',
                        style: TextStyle(color: buttonColor),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
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
    );
  }
}
