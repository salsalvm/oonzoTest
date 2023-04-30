import 'package:firstcry/res/colors.dart';
import 'package:firstcry/res/styles.dart';
import 'package:flutter/material.dart';

class KUtils {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackMessage(
    BuildContext context, {
    required String message,
    required Color color,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        content: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            message,
            maxLines: 3,
            style: KStyle.content(
                fontWeight: FontWeight.w600, color: kWhite, size: 13),
          ),
        ),
      ),
    );
  }
}
