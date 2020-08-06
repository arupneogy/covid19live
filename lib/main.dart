//import 'package:covid19live/model/covidDetail.dart';
import 'package:covid19live/screens/Home.dart';
import 'package:covid19live/services/HtmlLoad.dart';
import 'package:covid19live/services/HtmlParse.dart';
import 'package:flutter/material.dart';
import 'package:covid19live/utils/Themes/CovTheme.dart';
void main() {
  //var rawdoc=HtmlLoad.fetchData();
  //HtmlParse.fetchStateData(rawdoc);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COVID19LIVE',
      theme: covidTheme(),
      home:Home(),
    );
  }
}

