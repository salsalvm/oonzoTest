import 'package:firstcry/res/colors.dart';
import 'package:firstcry/res/styles.dart';
import 'package:flutter/material.dart';

class PageParenting extends StatelessWidget {
  const PageParenting({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'parenting',
        style: KStyle.title(color: kWarnning),
      ),
    );
  }
}
