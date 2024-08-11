// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:practice/nav_return_try/option_screen.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          const Text(
            'Select an option',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          // ignore: prefer_const_constructors
          Gap(20),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OptionScreen(),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('$result'),
                  backgroundColor: Colors.green,
                ));
              },
              child: const Text('Select Option'),
            ),
          ),
          
        ],
      ),
    );
  }
}
