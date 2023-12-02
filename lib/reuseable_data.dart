import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({super.key, required this.color, required this.cardChild});

  final Color color;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: kBorderColor),
        color: color,
      ),
      child: cardChild,
    );
  }
}

class NumberButton extends StatelessWidget {
  const NumberButton(
      {super.key,
      required this.label,
      required this.color,
      required this.backColor,
      this.splashColor,
      required this.onPress});

  final String label;
  final Color? splashColor, color, backColor;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawMaterialButton(
        onPressed: onPress,
        constraints: const BoxConstraints.tightFor(
          height: 75.0,
        ),
        splashColor: splashColor,
        shape: const CircleBorder(),
        fillColor: backColor,
        child: Text(
          label,
          style: TextStyle(fontSize: 40, color: color),
        ),
      ),
    );
  }
}
