import 'package:flutter/material.dart';

import '../constants/color.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final bool isActive;
  final Color textColor;
  final Color bodyColor;
  final VoidCallback function;
  final double buttonWidth;
  final double? buttonHeight;
  final double? textHeight;
  const CustomButton(
      {Key? key,
      required this.text,
      required this.isActive,
      required this.textColor,
      required this.bodyColor,
      required this.buttonWidth,
      this.buttonHeight,
      required this.function,
      this.textHeight})
      : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.buttonWidth,
        height: 60,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                enableFeedback: widget.isActive ? true : false,
                splashFactory: InkRipple.splashFactory,
                animationDuration: widget.isActive
                    ? Duration(milliseconds: 700)
                    : Duration(microseconds: 0),
                backgroundColor: widget.bodyColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
            onPressed: () {
              widget.isActive ? widget.function() : null;
            },
            child: Text(
              widget.text,
              style: TextStyle(
                  color: widget.textColor,
                  fontSize: widget.textHeight ?? 20,
                  fontWeight: FontWeight.w600),
            )));
  }
}
