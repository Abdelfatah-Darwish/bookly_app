import '../styles.dart';
import 'package:flutter/material.dart';

class CustomBookButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final double? fontSize;
  final FontWeight? fontWeight;
  const CustomBookButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.borderRadius,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          // changing shape
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
