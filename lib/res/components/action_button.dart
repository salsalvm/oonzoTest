import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.child,
    required this.onTap,
    required this.color,
    this.radius = 10,
    this.buttonWidth = 340,
    this.buttonHeight = 40,
  }) : super(key: key);
  final VoidCallback onTap;
  final Widget child;
  final double radius;
  final Color color;
  final double buttonHeight;
  final double buttonWidth;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
      onPressed: onTap,
      color: color,
      minWidth: buttonWidth,
      height: buttonHeight,
      child: child,
    );
  }
}
