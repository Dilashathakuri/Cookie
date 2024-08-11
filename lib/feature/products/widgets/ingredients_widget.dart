// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class IngredientsWidget extends StatefulWidget {
  const IngredientsWidget(
      {super.key,
      required this.percentage,
      required this.grams,
      required this.ingredient,
      required this.color});

  final String percentage;
  final String grams;
  final String ingredient;
  final Color color;

  @override
  State<IngredientsWidget> createState() => _IngredientsWidgetState();
}

class _IngredientsWidgetState extends State<IngredientsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(70),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 16, left: 10, right: 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Text('${widget.percentage}%'),
              ),
            ),
            Gap(16),
            Text(
              '${widget.grams}gram',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w500),
            ),
            Gap(4),
            Text(
              widget.ingredient,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
