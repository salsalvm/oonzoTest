// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstcry/res/colors.dart';
import 'package:firstcry/res/components/action_button.dart';
import 'package:firstcry/res/styles.dart';
import 'package:firstcry/utils/routes/routes_name.dart';
import 'package:firstcry/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageProfile extends StatelessWidget {
  const PageProfile({super.key});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: ActionButton(
        color: const Color(0xffFFC238),
        radius: 5,
        onTap: () async {
          // authController.signOut(context);
          await FirebaseAuth.instance.signOut().then((value) async {
            SharedPreferences sharedPref =
                await SharedPreferences.getInstance();
            sharedPref.clear();

            await Navigator.pushReplacementNamed(context, KRoutesName.login);
            KUtils.snackMessage(context,
                color: kError, message: 'Logout success fully');
          }).onError((error, stackTrace){
          });
        },
        child: Text('Sign Out', style: KStyle.title(color: kWhite)),
      ),
    );
  }
}
