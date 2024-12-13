import 'package:bmi_calc/Components/constants.dart';
import 'package:bmi_calc/Components/icon_card.dart';
import 'package:bmi_calc/Components/reusable_card.dart';
import 'package:bmi_calc/calculater_brain.dart';
import 'package:bmi_calc/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedgender;

  int selectedHeight = 180;
  int selectedWeight = 60;
  int selectedAge = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusable_Card(
                    onPressed: () {
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    },
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.mars,
                      cardText: "MALE",
                    ),
                    colour: selectedgender == Gender.male
                        ? kactiveColor
                        : kinactiveColor,
                  ),
                ),
                Expanded(
                  child: Reusable_Card(
                    onPressed: () {
                      setState(() {
                        selectedgender = Gender.female;
                      });
                    },
                    cardChild: IconCard(
                      cardIcon: FontAwesomeIcons.venus,
                      cardText: "FEMALE",
                    ),
                    colour: selectedgender == Gender.female
                        ? kactiveColor
                        : kinactiveColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reusable_Card(
              infinityWidth: double.infinity,
              colour: kactiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: klabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        selectedHeight.toString(),
                        style: knumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: klabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x22EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 16),
                    ),
                    child: Slider(
                      value: selectedHeight.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          selectedHeight = newValue.round();
                        });
                      },
                      min: 120,
                      max: 220,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reusable_Card(
                    colour: kactiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weight",
                          style: klabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              selectedWeight.toString(),
                              style: knumberTextStyle,
                            ),
                            Text(
                              "kg",
                              style: klabelTextStyle,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(FontAwesomeIcons.minus),
                              onPressed: () {
                                setState(() {
                                  selectedWeight--;
                                });
                              },
                            ),
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(FontAwesomeIcons.plus),
                              onPressed: () {
                                setState(() {
                                  selectedWeight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reusable_Card(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style: klabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              selectedAge.toString(),
                              style: knumberTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(FontAwesomeIcons.minus),
                              onPressed: () {
                                setState(() {
                                  selectedAge--;
                                });
                              },
                            ),
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(FontAwesomeIcons.plus),
                              onPressed: () {
                                setState(() {
                                  selectedAge++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    colour: kactiveColor,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                  height: selectedHeight, weight: selectedWeight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.CalculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              child: Text(
                "Calculate",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              color: kbottomContainerColor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kbottomContainerHeight,
            ),
          ),
        ],
      ),
    );
  }
}
