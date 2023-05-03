import 'package:firstcry/view/auth/login_screen.dart';
import 'package:firstcry/view/auth/signup_screen.dart';
import 'package:firstcry/view/auth/splash_screen.dart';
import 'package:firstcry/view/home/screen_home.dart';
import 'package:firstcry/view/product/screen_product.dart';
import 'package:flutter/material.dart';

import 'routes_name.dart';
//This class is a standerd routing in flutter its work on help of getx packages
//it's a example of push named routing
//easily to handle page routing with help of this private list items
//this private  list name we can get  the help of get variable.

class KRoute {
  //its a generatted routing method we can acces and rout any screen with endpoint name
  //its used to generated paged named parameter
  //its a page routing builder
  //because i want a transition right to left so i choose this method
  //in this below normal generatod method is ther
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //---splash screen rout
      case KRoutesName.splash:
        return kPageBuilder(
          (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              const ScreenSplash(),
        );

      //---login screen rout
      case KRoutesName.login:
        return kPageBuilder(
          (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              ScreenLogin(),
        );

      //---signup screen rout
      case KRoutesName.signup:
        return kPageBuilder(
          (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              ScreenSignUp(),
        );

      //---home screen rout
      case KRoutesName.home:
        return kPageBuilder(
          (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              const ScreenHome(),
        );

      //---home screen rout
      case KRoutesName.product:
        return kPageBuilder(
          (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              const ScreenProduct(),
        );

      //---page not found screen rout
      default:
        null;
    }
    return null;
  }

// this static method going with right to left annimation in each page rout
//this method calling many
// code re-usability
  static PageRouteBuilder<dynamic> kPageBuilder(
      Widget Function(BuildContext, Animation<double>, Animation<double>)
          pageBuilder) {
    return PageRouteBuilder<dynamic>(
      pageBuilder: pageBuilder,
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget? child) {
        const Offset begin = Offset(1.0, 0.0);
        const Offset end = Offset.zero;
        const Cubic curve = Curves.ease;

        final Animatable<Offset> tween =
            Tween<Offset>(begin: begin, end: end).chain(
          CurveTween(
            curve: curve,
          ),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
