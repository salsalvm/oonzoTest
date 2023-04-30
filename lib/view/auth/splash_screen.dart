import 'package:firstcry/res/asset/atuh_images.dart';
import 'package:firstcry/res/colors.dart';
import 'package:firstcry/utils/routes/routes_name.dart';
import 'package:firstcry/view_model/home_constroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

late Size size;
String logged = 'login success';
Object? userToken;

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    checkUserLogin(context);
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height * .6,
          width: size.width * .8,
          decoration: const BoxDecoration(
            color: kWhite,
            image: DecorationImage(
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
              image: AssetImage(AuthImages.splash),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkUserLogin(context) async {
    SharedPreferences sharePref = await SharedPreferences.getInstance();

    userToken = sharePref.get(logged);
    if (userToken == false || userToken == null) {
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacementNamed(context, KRoutesName.login);
    } else {
      Get.put(HomeController());
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacementNamed(context, KRoutesName.home);
    }
  }
}
