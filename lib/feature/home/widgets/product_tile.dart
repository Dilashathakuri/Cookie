// ignore_for_file: prefer_const_constructors, unnecessary_cast



import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:practice/core/theme/colors.dart';

class ProductTile extends StatefulWidget {
  const ProductTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.image});

  final String title;
  final String subtitle;
  final String price;
  final String image;
  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/cookie.png'),
                foregroundImage: NetworkImage(widget.image as String),
              ),
            ],
          ),
          const Gap(2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(color: buttonColor),
              ),
              SizedBox(
                width: size.width * 0.5,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  widget.subtitle,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          const Gap(2),
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.price,
                style: TextStyle(color: Colors.black),
              ),
            ],
          )
        ],
      ),
    );
  }
}
