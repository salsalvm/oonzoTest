import 'package:firstcry/res/colors.dart';
import 'package:firstcry/res/components/action_button.dart';
import 'package:firstcry/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageMenu extends StatelessWidget {
  const PageMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'menu',
        style: KStyle.title(color: kWarnning),
      ),
    );
  }
}
