import 'package:firstcry/res/colors.dart';
import 'package:firstcry/res/styles.dart';
import 'package:flutter/material.dart';

class PageExplore extends StatelessWidget {
  const PageExplore({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Explore',
        style: KStyle.title(color: kWarnning),
      ),
    );
  }
}
