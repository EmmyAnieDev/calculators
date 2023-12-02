import 'bmi_screen.dart';
import 'package:flutter/material.dart';
import 'ios_screen.dart';

class CalculatorPageView extends StatefulWidget {
  const CalculatorPageView({
    super.key,
  });

  @override
  State<CalculatorPageView> createState() => _CalculatorPageViewState();
}

class _CalculatorPageViewState extends State<CalculatorPageView> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      controller: controller,
      children: const [IosScreen(), BmiScreen()],
    );
  }
}
