import 'package:flutter/material.dart';
import '../components/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'bmi_screen.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({
    Key? key,
    required this.bmiResult,
    required this.bmiResultText,
    required this.bmiResultMessage,
  }) : super(key: key);

  final String bmiResult;
  final String bmiResultText;
  final String bmiResultMessage;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: SizedBox(
          height: constraints.maxHeight * .5 + 30,
          child: Stack(
            children: [
              Positioned(
                bottom: 364,
                left: 0,
                right: 0,
                child: Center(
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BmiScreen(),
                        ),
                      );
                      // Action when the round button is pressed
                    },
                    elevation: 0,
                    shape: const CircleBorder(),
                    backgroundColor: kFloatingColor,
                    child: const Icon(
                      FontAwesomeIcons.arrowRotateRight,
                      color: kWhiteColor,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipPath(
                  clipper: TicketPassClipper(position: 228, holeRadius: 65),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: kBlueColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'Your BMI is',
                            style: kResultsStyle,
                          ),
                          Text(
                            '$bmiResult kg/m2',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
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
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.bookmark,
                                color: kWhiteColor,
                                size: 18,
                              ),
                              SizedBox(width: 18),
                              Icon(
                                FontAwesomeIcons.shareNodes,
                                color: kWhiteColor,
                                size: 18,
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
                bottom: 1,
                left: 0,
                right: 0,
                child: Container(
                  color: kBlueColor,
                  width: 50,
                  height: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
