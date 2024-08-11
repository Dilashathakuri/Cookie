// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_super_parameters

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:practice/core/theme/colors.dart';
import 'package:practice/feature/home/home_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                ),
            child: Icon(Icons.arrow_back_ios)),
        title: Text('My cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/cookie.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Chewy cookie',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '1cookie X4',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Gap(62),
                  Text('\$13.00'),
                  Gap(2),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 62, 62, 1),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                    height: 70,
                    width: 70,
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                          icon: Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Gap(2),
          ],

        ),
        
      ),
    );
  }
}
