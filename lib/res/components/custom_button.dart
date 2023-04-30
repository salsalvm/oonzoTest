import 'package:flutter/material.dart';

import '../colors.dart';

//this class contain a button. it is an each action button in this project.
//this button also added gradient and its a optional parameter we can use our usecases
//used with instance of a class
//form with help of constructor
class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.widget,
      required this.onTap,
      this.buttonWidth = double.infinity,
      this.buttonHeight = 50,
      this.color = kTransperent,
      this.fontSize = 24,
      this.radius = 25,
      this.gradient,
      this.borderColor = kTransperent});
  final VoidCallback onTap;
  final Widget widget;
  final double radius;
  final Color color;
  final Color borderColor;
  final double buttonHeight;
  final double buttonWidth;
  final double fontSize;
  final Gradient? gradient;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(buttonWidth, buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          shadowColor: kTransperent,
          side: BorderSide(
            color: borderColor,
            width: 1,
            // strokeAlign: strokala.center,
          ),
          elevation: 0,
          padding:
              const EdgeInsetsDirectional.only(start: 0, top: 2, bottom: 2),
        ),
        child: Ink(
          height: buttonHeight,
          width: buttonWidth,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Center(child: widget),
        ),
      ),
    );
  }
}
