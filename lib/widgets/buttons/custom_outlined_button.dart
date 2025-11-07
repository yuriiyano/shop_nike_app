import 'package:flutter/material.dart';

import 'package:shop_nike_app/styles/index.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.fontFamily = FontFamily.heebo,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
    this.textColor = Colors.white,
    this.borderColor = Colors.white,
    this.borderRadius = 100.0,
    this.borderWidth = 1.0,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
    this.backgroundColor = Colors.transparent,
  });

  final String text;
  final void Function() onPressed;
  final double? width;
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final Color borderColor;
  final Color textColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final double borderWidth;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: borderColor, width: borderWidth),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding,
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          textStyle: TextStyle(
            fontFamily: fontFamily,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
