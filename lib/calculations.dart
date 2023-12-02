import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.weight, this.height});

  final int? height;
  final int? weight;
  double? _bmi;

  String calculateBMI() {
    _bmi = (weight! / pow(height! / 100, 2));
    return _bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi! >= 25) {
      return 'Overweight';
    } else if (_bmi! > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi! >= 25) {
      return 'A BMI of 25 and above indicates that you are Overweight for your height. By maintaining a healthy weight, you lower your risk of developing serious health problems.';
    } else if (_bmi! > 18.5) {
      return 'A BMI of 18.5 - 24.9 indicates that you are at a healthy weight for your height. By maintaining a healthy weight, you lower your risk of developing serious health problems.';
    } else {
      return 'A BMI of 18.4 and below indicates that you are Underweight for your height. By maintaining a healthy weight, you lower your risk of developing serious health problems.';
    }
  }
}
