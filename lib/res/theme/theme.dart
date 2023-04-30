import 'package:firstcry/res/styles.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

//this class contain project themedata we can change anything in here
//here we can change any type of text color and any components have set unique color like bottom navigation bar, appbar and scaffold
//we can add dark mode and light mode
//this private varial going with help of get method
//because get method treat with variables in flutter
class KTheme {
  final ThemeData _themeData = ThemeData(
//--------------text theme ---------------//colors<<<<<<<<<<<//

//--------------compponents color code---------------//
    scaffoldBackgroundColor: kWhite,
    appBarTheme: const AppBarTheme(backgroundColor: kWhite),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: kWhite,
        selectedItemColor: kWarnning,
        selectedLabelStyle: KStyle.content(color: kWarnning, size: 11),
        unselectedItemColor: kGrey,
        unselectedLabelStyle: KStyle.content(color: kGrey, size: 11),
        showUnselectedLabels: true,
        elevation: 10),
    visualDensity: VisualDensity.adaptivePlatformDensity,

//--------------font family---------------//
    fontFamily: 'Poppins',
  );

  ThemeData get theme => _themeData;
}
