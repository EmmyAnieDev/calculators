import 'package:calculators/bmi/calculations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculators/reusable%20widget/reuseable_data.dart';
import '../components/constants.dart';
import 'result_page.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.r),
                child: Text(
                  'BMI Calculator',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: kFloatingColor,
                    fontSize: 25.sp,
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
                          margin: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: clickedGender == Gender.male
                                ? Border.all(width: 3.w, color: kBlackColor)
                                : Border.all(width: 2.w, color: kBorderColor),
                            color: kWhiteColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.mars,
                                size: 70.sp,
                                color: const Color(0xFFFFD279),
                              ),
                              SizedBox(height: 15.h),
                              const Text('Male', style: kLabelStyle),
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
                          margin: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: clickedGender == Gender.female
                                ? Border.all(width: 3.w, color: kBlackColor)
                                : Border.all(width: 2.w, color: kBorderColor),
                            color: kWhiteColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.venus,
                                size: 70.sp,
                                color: const Color(0xFFF94B86),
                              ),
                              SizedBox(height: 15.h),
                              const Text('Female', style: kLabelStyle),
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
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight * 0.04,
                        ),
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
                            height = value.round(); // round to integer
                          });
                        },
                        width: screenWidth * 0.8,
                        height: screenHeight * 0.05,
                        rulerMarginTop: 1,
                        marker: Container(
                          width: 3.w,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5.r),
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
                          padding: EdgeInsets.all(8.r),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'Weight (kg)',
                                style: kLabelStyle,
                              ),
                              Container(
                                width: 110.w,
                                height: 55.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  color: const Color(0xFFEEEEF0),
                                ),
                                child: NumberPicker(
                                  itemWidth: 37
                                      .w, // Set an approximate width for each item
                                  itemCount: 3,
                                  minValue: 30,
                                  maxValue: 90,
                                  value: weight,
                                  textStyle: TextStyle(fontSize: 14.sp),
                                  selectedTextStyle: TextStyle(
                                      fontSize: 28.sp,
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
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        color: kWhiteColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('Age', style: kLabelStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  child: Icon(FontAwesomeIcons.squareMinus,
                                      size: 30.sp),
                                ),
                                Text(
                                  age.toString(),
                                  style: TextStyle(
                                      fontSize: 38.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  child: Icon(FontAwesomeIcons.squarePlus,
                                      size: 28.sp),
                                ),
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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          child: BottomAppBar(
            height: screenHeight * 0.11,
            elevation: 0,
            shape: const CircularNotchedRectangle(),
            color: kBlueColor,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        FontAwesomeIcons.chartLine,
                        color: kWhiteColor,
                        size: 18,
                      ),
                      SizedBox(height: 5.h),
                      const Text(
                        'ACTIVITY',
                        style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        FontAwesomeIcons.user,
                        color: kWhiteColor,
                        size: 18,
                      ),
                      SizedBox(height: 5.h),
                      const Text(
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
        child: Text(
          'BMI',
          style: TextStyle(
              fontSize: 15.sp, fontWeight: FontWeight.bold, color: kWhiteColor),
        ),
      ),
    );
  }
}
