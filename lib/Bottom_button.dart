// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'Constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({
    this.onTap,
    this.ButtonTitle,
  });

  final VoidCallback onTap;
  final String ButtonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            ButtonTitle,
            style: kLargeTextStyle,
          ),
        ),
        color: kBottomcontainercolor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomcontainerheight,
      ),
    );
  }
}
