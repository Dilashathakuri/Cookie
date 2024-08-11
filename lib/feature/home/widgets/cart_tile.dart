import 'package:flutter/material.dart';
import 'package:practice/feature/home/home_screen.dart';

class CartTile extends StatefulWidget {
  const CartTile({super.key});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const HomeScreen())),
        ),
        title: const Text('My Cart'),
      ),
      body: const Column(
        children: [
          
        ],
      ),
    );
  }
}