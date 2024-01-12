import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      fontFamily: 'FontBold',
      primarySwatch:  Colors.indigo,
     // primarySwatch:  Colors.lightBlue,
      primaryColor: const Color(0xff0d2243),
      secondaryHeaderColor:const Color(0xff0d2243), //Primary2Color
      backgroundColor:const Color(0xffFFFFFF),
      hintColor:const Color(0xFF9D9D9D),
      focusColor:const Color(0xFF222222), // TextColor
      hoverColor:const Color(0xFF6C6C6C), // labelColor
      highlightColor: const Color(0xff0d2243), // primary3Color
      unselectedWidgetColor: const Color(0xff0d2243), // primary3Color
    );
  }


}