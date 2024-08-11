// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProfileItem extends StatefulWidget {
  final String title;
  final String value;
  const ProfileItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  State<ProfileItem> createState() => _ProfileItemState();
}

class _ProfileItemState extends State<ProfileItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              widget.value,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
