import 'package:flutter/material.dart';

class Reusable_Card extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
  final void Function()? onPressed;
  final double? infinityWidth;
  Reusable_Card({required this.colour, this.cardChild, this.onPressed, this.infinityWidth});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        width: infinityWidth,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
