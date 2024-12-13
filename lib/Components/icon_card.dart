import 'package:bmi_calc/Components/constants.dart';
import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  final String cardText;
  final IconData cardIcon;
  IconCard({required this.cardText, required this.cardIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: kiconSize,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          cardText,
          style: klabelTextStyle,
        ),
      ],
    );
  }
}
