import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget {
  final Function() onPressed;
  final IconData? icon;
  const RoundIconButton({required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 6,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
