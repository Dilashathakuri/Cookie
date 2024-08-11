import 'package:flutter/material.dart';

import 'package:practice/core/theme/colors.dart';

class CustomRaisedButton extends StatefulWidget {
  const CustomRaisedButton({
    required this.label,
    required this.isButton,
    super.key,
  });

  final String label;
  final bool isButton;
  @override
  State<CustomRaisedButton> createState() => _CustomRaisedButtonState();
}

class _CustomRaisedButtonState extends State<CustomRaisedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.isButton == false ? null : 200,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          widget.label,
          // ignore: prefer_const_constructors
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
