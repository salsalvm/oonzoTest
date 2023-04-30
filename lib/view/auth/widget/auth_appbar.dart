import 'package:firstcry/res/colors.dart';
import 'package:firstcry/res/styles.dart';
import 'package:flutter/material.dart';

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: KStyle.heading(color: kWarnning, size: 24),
      ),
    );
  }
}
