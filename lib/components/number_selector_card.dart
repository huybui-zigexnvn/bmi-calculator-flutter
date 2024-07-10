import 'package:flutter/material.dart';
import 'constants.dart';
import 'round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NumberSelectorCard extends StatelessWidget {
  final String label;
  final int value;
  final Function() onDecrement;
  final Function() onIncrement;

  NumberSelectorCard({
    required this.label,
    required this.value,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: kLabelTextStyle,
        ),
        Text(
          value.toString(),
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              onPressed: onDecrement,
              icon: FontAwesomeIcons.minus,
            ),
            SizedBox(
              width: 10,
            ),
            RoundIconButton(
              onPressed: onIncrement,
              icon: FontAwesomeIcons.plus,
            ),
          ],
        ),
      ],
    );
  }
}
