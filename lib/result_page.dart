import 'package:bmi_calc/Components/constants.dart';
import 'package:bmi_calc/Components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiResult,
      required this.interpretation,
      required this.resultText});

  final String? bmiResult;
  final String? resultText;
  final String? interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Results"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Reusable_Card(
              colour: kactiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(resultText != null ? resultText! : "Calculating"),
                  Text(bmiResult != null ? bmiResult! : "Calculating"),
                  Text(
                      interpretation != null ? interpretation! : "Calculating"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
