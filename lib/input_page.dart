// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, camel_case_types, use_key_in_widget_constructors, sort_child_properties_last, unused_import

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/Calculator_brain.dart';

import 'Constants.dart';
import 'icon_content.dart';
import 'results_page.dart';
import 'reusable_card.dart';
import 'Bottom_button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusable_code(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActivecardcolor
                        : kInactiveColor,
                    cardchild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: Reusable_code(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActivecardcolor
                        : kInactiveColor,
                    cardchild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reusable_code(
                onPress: () {},
                cardchild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                        ),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0XFF8D8E98),
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.round();
                        });
                      },
                    )
                  ],
                ),
                colour: kActivecardcolor),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusable_code(
                    onPress: () {},
                    colour: kActivecardcolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                                heroTag: 'button1',
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                                heroTag: 'button2',
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reusable_code(
                    onPress: () {},
                    colour: kActivecardcolor,
                    cardchild: Column(
                      children: [
                        Text('Age', style: kLabelTextStyle),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                                heroTag: 'button3',
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                                heroTag: 'button4',
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            ButtonTitle: 'Calculate',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation()),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
