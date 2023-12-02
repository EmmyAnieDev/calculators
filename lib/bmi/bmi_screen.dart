import 'package:calculators/bmi/calculations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculators/reusable%20widget/reuseable_data.dart';
import '../components/constants.dart';
import 'result_page.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';

enum Gender {
  male,
  female,
}

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  late RulerPickerController _rulerPickerController;

  List<RulerRange> ranges = const [
    RulerRange(begin: 120, end: 220, scale: 1),
  ];

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController(value: height);
  }

  Gender? clickedGender;
  int weight = 58;
  int height = 172;
  int age = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'BMI Calculator',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: kFloatingColor,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            clickedGender = Gender.male;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: clickedGender == Gender.male
                                ? Border.all(width: 3, color: kBlackColor)
                                : Border.all(width: 2, color: kBorderColor),
                            color: kWhiteColor,
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.mars,
                                size: 67,
                                color: Color(0xFFFFD279),
                              ),
                              SizedBox(height: 15),
                              Text('Male', style: kLabelStyle),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            clickedGender = Gender.female;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: clickedGender == Gender.female
                                ? Border.all(width: 3, color: kBlackColor)
                                : Border.all(width: 2, color: kBorderColor),
                            color: kWhiteColor,
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.venus,
                                size: 67,
                                color: Color(0xFFF94B86),
                              ),
                              SizedBox(height: 15),
                              Text('Female', style: kLabelStyle),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: kWhiteColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Height (cm)',
                        style: kLabelStyle,
                      ),
                      Text(
                        height.toStringAsFixed(0),
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      ),
                      const SizedBox(height: 10),
                      RulerPicker(
                        controller: _rulerPickerController,
                        onBuildRulerScaleText: (index, value) {
                          return value.toInt().toString();
                        },
                        ranges: ranges,
                        onValueChanged: (value) {
                          setState(() {
                            height = value.round();
                          });
                        },
                        width: 310,
                        height: 50,
                        rulerMarginTop: 1,
                        marker: Container(
                          width: 3,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
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
                      child: ReusableCard(
                          color: kWhiteColor,
                          cardChild: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  'Weight (kg)',
                                  style: kLabelStyle,
                                ),
                                Container(
                                  width: 110,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: const Color(0xFFEEEEF0),
                                  ),
                                  child: NumberPicker(
                                    itemWidth:
                                        37, // Set an approximate width for each item
                                    itemCount: 3,
                                    minValue: 30,
                                    maxValue: 90,
                                    value: weight,
                                    selectedTextStyle: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight
                                            .bold), // Adjust the font size as needed
                                    onChanged: (int newValue) {
                                      setState(() {
                                        weight = newValue.round();
                                      });
                                    },
                                    axis: Axis.horizontal,
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                    Expanded(
                      child: ReusableCard(
                        color: kWhiteColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('Age'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    child: const Icon(
                                        FontAwesomeIcons.squareMinus)),
                                Text(
                                  age.toString(),
                                  style: const TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    child: const Icon(
                                        FontAwesomeIcons.squarePlus)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
        ),
        child: const ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomAppBar(
            height: 70,
            elevation: 0,
            shape: CircularNotchedRectangle(),
            color: kBlueColor,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.chartLine,
                        color: kWhiteColor,
                        size: 18,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'ACTIVITY',
                        style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  SizedBox(width: 0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.user,
                        color: kWhiteColor,
                        size: 18,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'PROFILE',
                        style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ]),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CalculatorBrain calc =
              CalculatorBrain(height: height, weight: weight);
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) => ResultsPage(
              bmiResult: calc.calculateBMI(),
              bmiResultText: calc.getResult(),
              bmiResultMessage: calc.getInterpretation(),
            ),
          );
        },
        elevation: 0,
        shape: const CircleBorder(),
        backgroundColor: kFloatingColor,
        child: const Text(
          'BMI',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: kWhiteColor),
        ),
      ),
    );
  }
}
