import 'package:flutter/material.dart';
import 'package:calculators/components/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({super.key, required this.color, required this.cardChild});

  final Color color;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(width: 2.w, color: kBorderColor),
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
    final sizeHeight = MediaQuery.of(context).size.height;
    return Expanded(
      child: RawMaterialButton(
        onPressed: onPress,
        constraints: BoxConstraints.tightFor(
          height: 65.h,
        ),
        splashColor: splashColor,
        shape: const CircleBorder(),
        fillColor: backColor,
        child: Text(
          label,
          style: TextStyle(fontSize: sizeHeight * 0.05, color: color),
        ),
      ),
    );
  }
}
