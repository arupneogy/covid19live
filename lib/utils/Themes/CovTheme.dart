import 'package:flutter/material.dart';

ThemeData covidTheme(){
  TextTheme _basicTextTheme(TextTheme base) => base.copyWith(
    headline: base.headline.copyWith(
      fontFamily: 'Muli-ExtraBold',
      fontSize: 22.0,
      color: Colors.yellow[900]
    ),
    title: base.title.copyWith(
      fontFamily: 'Muli-Bold',
      fontSize: 18,
      color: Colors.yellow[800]
    ),
    body1: base.body1.copyWith(
      fontFamily: 'Muli-SemiBold',
      fontSize: 16,
      color: Colors.yellow[800]
    ),
    body2: base.body2.copyWith(
      fontFamily: 'Muli-Regular',
      fontSize: 16,
      color: Colors.yellow[600]
    ),
  );
  final ThemeData base=ThemeData.dark();
  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
    primaryColor: Color(0xFF1b1c1c),
    scaffoldBackgroundColor: Color(0xFF393b3b)
  );
}