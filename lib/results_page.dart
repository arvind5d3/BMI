// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/Constants.dart';
import 'package:project/reusable_card.dart';

import 'input_page.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({
    this.bmiResult,
    this.resultText,
    this.interpretation,
  });

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Reusable_code(
                colour: kActivecardcolor,
                onPress: () {},
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText,
                      style: kTextStyle,
                    ),
                    Text(bmiResult, style: kBmiTextStyle),
                    Text(
                      interpretation,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
