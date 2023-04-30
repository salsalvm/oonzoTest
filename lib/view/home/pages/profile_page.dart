import 'package:firstcry/res/colors.dart';
import 'package:firstcry/res/styles.dart';
import 'package:flutter/material.dart';

class PageProfile extends StatelessWidget {
  const PageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'profile',
        style: KStyle.title(color: kWarnning),
      ),
    );
  }
}
