import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/icon_content.dart';
import 'components/reusable_card.dart';
import 'components/constants.dart';
import 'components/number_selector_card.dart';
import 'components/bottom_button.dart';
import 'caculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 164;
  int weight = 70;
  int age = 28;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                          child: ReusableCard(
                        colour: selectedGender == Gender.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: iconContent(
                          label: 'MALE',
                          icon: FontAwesomeIcons.mars,
                        ),
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                      )),
                      Expanded(
                          child: ReusableCard(
                        colour: selectedGender == Gender.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: iconContent(
                          label: 'FEMALE',
                          icon: FontAwesomeIcons.venus,
                        ),
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                      )),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30)),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
              )),
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                          child: ReusableCard(
                              colour: kActiveCardColor,
                              cardChild: NumberSelectorCard(
                                label: 'WEIGHT',
                                value: weight,
                                onDecrement: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                onIncrement: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ))),
                      Expanded(
                        child: ReusableCard(
                            colour: kActiveCardColor,
                            cardChild: NumberSelectorCard(
                              label: 'AGE',
                              value: age,
                              onDecrement: () {
                                setState(() {
                                  age--;
                                });
                              },
                              onIncrement: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              BottomButton(
                buttonTitle: 'CACULATE',
                onTap: () {
                  CaculatorBrain calc =
                      CaculatorBrain(weight: weight, height: height);
                  String bmiResult = calc.calculateBMI();
                  String resultText =
                      calc.getResult(); // Calculate resultText based on BMI
                  String interpretation = calc.getInterpretation();
                  Navigator.pushNamed(
                    context,
                    '/results',
                    arguments: {
                      'bmiResult': bmiResult,
                      'resultText': resultText,
                      'interpretation': interpretation,
                    },
                  );
                },
              )
            ],
          ),
        ));
  }
}
