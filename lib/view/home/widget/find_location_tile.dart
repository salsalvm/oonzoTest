import 'package:firstcry/res/colors.dart';
import 'package:firstcry/res/styles.dart';
import 'package:flutter/material.dart';

class FindLocationTile extends StatelessWidget {
  const FindLocationTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        width: double.infinity,
        decoration: BoxDecoration(
          color: kGrey.withOpacity(.1),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: kGrey,
            ),
            Text(
              ' Select a location to see product availabilty',
              style: KStyle.content(),
            ),
            const Spacer(),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: kGrey,
            ),
          ],
        ),
      ),
    );
  }
}
