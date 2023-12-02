import 'package:flutter/material.dart';
import '../components/constants.dart';
import '../reusable widget/reuseable_data.dart';
import 'package:intl/intl.dart';

enum Color {
  division,
  multiply,
  minus,
  add,
  percent,
  ac,
  plusMinus,
  seven,
  eight,
  nine,
  four,
  five,
  six,
  one,
  two,
  three,
  zero,
  point,
  equals
}

class IosScreen extends StatefulWidget {
  const IosScreen({super.key});

  @override
  State<IosScreen> createState() => _IosScreenState();
}

class _IosScreenState extends State<IosScreen> {
  Color? selectedColor;
  bool isACPressed = false;

  int? firstValue, secondValue; //Two value for calculate + - / *
  String? sign; //It's + - / *
  String outcome = '', text = '0';

  void clickedNum(String btnNum) {
    if (btnNum == 'AC') {
      setState(() {
        outcome = '';
        text = '0'; // Reset text to '0'
        firstValue = 0; // Reset firstValue to null
        secondValue = 0; // Reset selectedColor to null
      });
    } else if (btnNum == '+/-') {
      setState(() {
        if (!text.startsWith('-')) {
          // If the number is positive, make it negative
          text = '-$text';
        } else {
          // If the number is negative, make it positive
          text = text.substring(1); // Remove the negative sign
        }
      });
    } else if (btnNum == '%') {
      setState(() {
        double value = double.parse(text);
        value = value / 100; // Calculate the percentage
        text = value.toString();
      });
    } else if (btnNum == '+' ||
        btnNum == '-' ||
        btnNum == '*' ||
        btnNum == '/') {
      setState(() {
        firstValue = int.parse(text);
        outcome = '';
        sign = btnNum;
        text = '0';
      });
    } else if (btnNum == '=') {
      setState(() {
        secondValue = int.parse(text);
        if (sign == '+') {
          outcome = (firstValue! + secondValue!).toString();
        } else if (sign == '-') {
          outcome = (firstValue! - secondValue!).toString();
        } else if (sign == '*') {
          outcome = (firstValue! * secondValue!).toString();
        } else if (sign == '/') {
          if (secondValue != 0) {
            outcome = (firstValue! / secondValue!).toString();
          } else {
            // Handle division by zero case
            outcome = 'Error'; // For example, display an error message
          }
        }
        text = outcome; // Update text with the calculated outcome
        double parsedOutcome = double.parse(outcome);
        if (parsedOutcome % 1 == 0) {
          // Check if the outcome is an integer
          text = parsedOutcome
              .toInt()
              .toString(); // Convert it to an integer if it is
        } else {
          text = parsedOutcome
              .toString(); // Keep it as a double if it has a decimal part
        }
      });
    } else {
      setState(() {
        if (text == '0') {
          text = btnNum; // If text is '0', replace it with the clicked number
        } else {
          text =
              text + btnNum; // Append the clicked number to the existing text
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 25, 0),
                    child: Text(
                      outcome == 'Error'
                          ? outcome
                          : NumberFormat.decimalPattern()
                              .format(double.tryParse(text) ?? 0),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 70,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  NumberButton(
                    label: isACPressed ? 'C' : 'AC',
                    color: kBlackColor,
                    backColor: kButtonGreyColor,
                    splashColor: kSplashColor3,
                    onPress: () {
                      setState(() {
                        selectedColor = Color.ac;
                        clickedNum('AC');
                        isACPressed = false;
                      });
                    },
                  ),
                  NumberButton(
                    label: '+/-',
                    color: kBlackColor,
                    backColor: kButtonGreyColor,
                    splashColor: kSplashColor3,
                    onPress: () {
                      setState(() {
                        selectedColor = Color.plusMinus;
                        clickedNum('+/-');
                      });
                    },
                  ),
                  NumberButton(
                    label: '%',
                    color: kBlackColor,
                    backColor: kButtonGreyColor,
                    splashColor: kSplashColor3,
                    onPress: () {
                      setState(() {
                        selectedColor = Color.percent;
                        clickedNum('%');
                      });
                    },
                  ),
                  NumberButton(
                    label: '/',
                    color: selectedColor == Color.division
                        ? kAmberColor
                        : kWhiteColor,
                    backColor: selectedColor == Color.division
                        ? kWhiteColor
                        : kAmberColor,
                    onPress: () {
                      setState(() {
                        selectedColor = Color.division;
                        clickedNum('/');
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              Row(
                children: [
                  NumberButton(
                    label: '7',
                    color: kWhiteColor,
                    backColor: kButtonColor,
                    splashColor: kSplashColor1,
                    onPress: () {
                      setState(() {
                        selectedColor = Color.seven;
                        clickedNum('7');
                        isACPressed = true;
                      });
                    },
                  ),
                  NumberButton(
                    label: '8',
                    color: kWhiteColor,
                    backColor: kButtonColor,
                    splashColor: kSplashColor1,
                    onPress: () {
                      setState(() {
                        selectedColor = Color.eight;
                        clickedNum('8');
                        isACPressed = true;
                      });
                    },
                  ),
                  NumberButton(
                    label: '9',
                    color: kWhiteColor,
                    backColor: kButtonColor,
                    splashColor: kSplashColor1,
                    onPress: () {
                      setState(() {
                        selectedColor = Color.nine;
                        clickedNum('9');
                        isACPressed = true;
                      });
                    },
                  ),
                  NumberButton(
                    label: 'x',
                    color: selectedColor == Color.multiply
                        ? kAmberColor
                        : kWhiteColor,
                    backColor: selectedColor == Color.multiply
                        ? kWhiteColor
                        : kAmberColor,
                    onPress: () {
                      setState(() {
                        selectedColor = Color.multiply;
                        clickedNum('*');
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              Row(
                children: [
                  NumberButton(
                    label: '4',
                    color: kWhiteColor,
                    backColor: kButtonColor,
                    splashColor: kSplashColor1,
                    onPress: () {
                      setState(() {
                        selectedColor = Color.four;
                        clickedNum('4');
                        isACPressed = true;
                      });
                    },
                  ),
                  NumberButton(
                    label: '5',
                    color: kWhiteColor,
                    backColor: kButtonColor,
                    splashColor: kSplashColor1,
                    onPress: () {
                      setState(() {
                        selectedColor = Color.five;
                        clickedNum('5');
                        isACPressed = true;
                      });
                    },
                  ),
                  NumberButton(
                    label: '6',
                    color: kWhiteColor,
                    backColor: kButtonColor,
                    splashColor: kSplashColor1,
                    onPress: () {
                      setState(() {
                        selectedColor = Color.six;
                        clickedNum('6');
                        isACPressed = true;
                      });
                    },
                  ),
                  NumberButton(
                    label: '-',
                    color: selectedColor == Color.minus
                        ? kAmberColor
                        : kWhiteColor,
                    backColor: selectedColor == Color.minus
                        ? kWhiteColor
                        : kAmberColor,
                    onPress: () {
                      setState(() {
                        selectedColor = Color.minus;
                        clickedNum('-');
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              Row(
                children: [
                  NumberButton(
                    label: '1',
                    color: kWhiteColor,
                    backColor: kButtonColor,
                    splashColor: kSplashColor1,
                    onPress: () {
                      setState(() {
                        selectedColor = Color.one;
                        clickedNum('1');
                        isACPressed = true;
                      });
                    },
                  ),
                  NumberButton(
                    label: '2',
                    color: kWhiteColor,
                    backColor: kButtonColor,
                    splashColor: kSplashColor1,
                    onPress: () {
                      setState(() {
                        selectedColor = Color.two;
                        clickedNum('2');
                        isACPressed = true;
                      });
                    },
                  ),
                  NumberButton(
                    label: '3',
                    color: kWhiteColor,
                    backColor: kButtonColor,
                    splashColor: kSplashColor1,
                    onPress: () {
                      setState(() {
                        selectedColor = Color.three;
                        clickedNum('3');
                        isACPressed = true;
                      });
                    },
                  ),
                  NumberButton(
                    label: '+',
                    color:
                        selectedColor == Color.add ? kAmberColor : kWhiteColor,
                    backColor:
                        selectedColor == Color.add ? kWhiteColor : kAmberColor,
                    onPress: () {
                      setState(() {
                        selectedColor = Color.add;
                        clickedNum('+');
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7.0),
                      child: RawMaterialButton(
                        padding: const EdgeInsets.fromLTRB(30, 0, 120, 0),
                        onPressed: () {
                          setState(() {
                            selectedColor = Color.zero;
                            clickedNum('0');
                          });
                        },
                        constraints: const BoxConstraints.tightFor(
                          height: 75.0,
                        ),
                        splashColor: kSplashColor1,
                        shape: const StadiumBorder(),
                        fillColor: kButtonColor,
                        child: const Text(
                          '0',
                          style: TextStyle(
                            fontSize: 40,
                            color: kWhiteColor,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ),
                  NumberButton(
                    label: '.',
                    color: kWhiteColor,
                    backColor: kButtonColor,
                    splashColor: kSplashColor1,
                    onPress: () {
                      setState(() {
                        selectedColor = Color.point;
                        clickedNum('.');
                        isACPressed = true;
                      });
                    },
                  ),
                  NumberButton(
                    label: '=',
                    color: kWhiteColor,
                    backColor: kAmberColor,
                    splashColor: kSplashColor2,
                    onPress: () {
                      setState(() {
                        selectedColor = Color.equals;
                        clickedNum('=');
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
