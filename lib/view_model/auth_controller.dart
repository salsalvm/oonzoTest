// ignore_for_file: use_build_context_synchronously

import 'package:firstcry/repository/auth_repository.dart';
import 'package:firstcry/res/colors.dart';
import 'package:firstcry/utils/routes/routes_name.dart';
import 'package:firstcry/utils/utils.dart';
import 'package:firstcry/view/auth/splash_screen.dart';
import 'package:firstcry/view/home/screen_home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final AuthRepository authRepo = AuthRepository();
  bool _loading = false;
  RxBool get loading => _loading.obs;
  setLoading(bool value) {
    _loading = value;
    update();
  }

  bool _signUploading = false;
  RxBool get signUploading => _signUploading.obs;
  setSignUploading(bool value) {
    _signUploading = value;
    update();
  }

  Future<void> userLogin(BuildContext context,
      {required String mail, required String pass}) async {
    if (GetUtils.isEmail(mail) && pass.length > 5) {
      setLoading(true);
      Map<String, dynamic> data = {'email': mail, 'password': pass};

      authRepo.userLogin(data).then((value) async {
        setLoading(false);
        final SharedPreferences sharedPref =
            await SharedPreferences.getInstance();
        if (kDebugMode) {
          print(data);
        }
        sharedPref.setString(logged, 'isTrue');
        sharedPref.get(logged);
        KUtils.snackMessage(context,
            message: 'Login SuccesFully', color: kSuccess);

        //
        indexChangerNavigator.value = 0;
        Navigator.pushNamedAndRemoveUntil(
            context, KRoutesName.home, (Route<dynamic> route) => false);
      }).onError(
        (error, stackTrace) {
          setLoading(false);

          KUtils.snackMessage(context,
              message: error.toString(), color: kError);
          if (kDebugMode) {
            print(error.toString());
          }
        },
      );
    } else {
      KUtils.snackMessage(context,
          message: 'entered incorrect password', color: kError);
    }
  }

  Future<void> userRegistration(BuildContext context,
      {required String mail, required String pass}) async {
    if (GetUtils.isEmail(mail) && pass.length > 5) {
      setSignUploading(true);
      Map<String, dynamic> data = {'email': mail, 'password': pass};

      authRepo.userRegister(data).then((value) async {
        setSignUploading(false);

        if (kDebugMode) {
          print(data);
        }

        KUtils.snackMessage(context,
            message: 'Registration SuccesFully', color: kSuccess);

        //
        indexChangerNavigator.value = 0;
        Navigator.pushNamedAndRemoveUntil(
            context, KRoutesName.login, (Route<dynamic> route) => false);
      }).onError((error, stackTrace) {
        setSignUploading(false);

        KUtils.snackMessage(context, message: error.toString(), color: kError);
        if (kDebugMode) {
          print(error.toString());
        }
      });
    } else {
      KUtils.snackMessage(context,
          color: kError, message: 'entered incorrect password');
    }
  }
// ----------sign out----------//

  Future<void> signOut(BuildContext context) async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.clear();

    update();
    await Navigator.pushReplacementNamed(context, KRoutesName.login);
    KUtils.snackMessage(context,
        color: kError, message: 'Logout success fully');
  }
}
