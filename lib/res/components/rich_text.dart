import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../styles.dart';

// this class contain two text widget in a single widget name richtext
//we can easily to change unique colores and action tap function in each text
//inside we can create morethan text widget because its a span type (inline elements)

class KRichText extends StatelessWidget {
  const KRichText(
      {super.key,
      required this.firstText,
      required this.secondText,
      this.ontap,
      this.color = kPrimary});
  final String firstText;
  final String secondText;
  final Color color;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: firstText,
          style: KStyle.title(),
          children: <InlineSpan>[
            TextSpan(
              text: secondText,
              style: KStyle.title(color: color, fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()..onTap = ontap,
            ),
          ],
        ),
      ),
    );
  }
}
