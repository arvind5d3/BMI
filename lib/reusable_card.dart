// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Reusable_code extends StatelessWidget {
  Reusable_code({this.cardchild, this.colour, this.onPress});

  final Widget cardchild;
  final Color colour;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardchild,
      ),
    );
  }
}
