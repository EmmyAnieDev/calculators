import 'package:flutter/material.dart';
import '../components/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({
    super.key,
    required this.bmiResult,
    required this.bmiResultText,
    required this.bmiResultMessage,
  });

  final String bmiResult;
  final String bmiResultText;
  final String bmiResultMessage;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: SizedBox(
          height: screenHeight * 0.535,
          child: Stack(
            children: [
              Positioned(
                bottom: screenHeight * 0.425,
                left: 0,
                right: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: screenWidth * 0.14,
                      height: screenHeight * 0.14,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: kFloatingColor),
                      child: Icon(
                        FontAwesomeIcons.arrowRotateRight,
                        color: kWhiteColor,
                        size: 18.sp,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipPath(
                  clipper: TicketPassClipper(
                      position: screenWidth * 0.58,
                      holeRadius: screenWidth * 0.16),
                  child: Container(
                    height: screenHeight * 0.495,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kBlueColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 30.h, horizontal: 40.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Your BMI is',
                            style: kResultsStyle,
                          ),
                          Text(
                            '$bmiResult kg/m2',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.sp,
                                color: kWhiteColor),
                          ),
                          Text(
                            '($bmiResultText)',
                            style: kResultsStyle,
                          ),
                          Text(
                            bmiResultMessage,
                            textAlign: TextAlign.center,
                            style: kResultsStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.bookmark,
                                color: kWhiteColor,
                                size: 18.sp,
                              ),
                              SizedBox(width: 18.w),
                              Icon(
                                FontAwesomeIcons.shareNodes,
                                color: kWhiteColor,
                                size: 18.sp,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: screenHeight * 0,
                left: 0,
                right: 0,
                child: Container(
                  color: kBlueColor,
                  height: screenHeight * 0.05,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
