// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({super.key});

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios)),
        title: const Text('Option Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () =>
                    Navigator.pop(context, 'you have selected option 1'),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  height: 60,
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('Option 1'),
                  ),
                ),
              ),
              Gap(20),
              GestureDetector(
                onTap: () =>
                    Navigator.pop(context, 'you have selected option 2'),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  height: 60,
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('Option 2'),
                  ),
                ),
              ),
              Gap(20),
              GestureDetector(
                onTap: () =>
                    Navigator.pop(context, 'you have selected option 3'),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black),
                  ),
                  height: 60,
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('Option 3'),
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
