import 'dart:async';
import 'package:covid19live/model/covidDetail.dart';
import 'package:covid19live/screens/Display.dart';
import 'package:covid19live/services/HtmlLoad.dart';
import 'package:covid19live/services/HtmlParse.dart';
import 'package:flutter/material.dart' ;
import 'package:html/dom.dart' as dom;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  Future<dom.Document> rawdoc;
  Future<CovidDetail> covnatdet;
  Future<List<CovidDetail>> covstatedet;

  @override
  void initState() {
    super.initState();
     _reLoad();
  }
  Future<void>  _reLoad() async{
    setState(() {
      rawdoc=HtmlLoad.fetchData();
      covnatdet= HtmlParse.fetchNatData(rawdoc);
      covstatedet=HtmlParse.fetchStateData(rawdoc);
    });
  }
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text('Covid19 India Stats',
      style: Theme.of(context).textTheme.headline,)
        ),
        body: ListView(
              children: <Widget>[
                  _buildNatData(covnatdet,context),
                  _buildStateData(covstatedet,context),
              ]
                ),
         ),
    ) ;  
  }
  Widget _buildNatData(Future<CovidDetail> natdet ,BuildContext context) {
    return FutureBuilder<CovidDetail>(
            future: natdet,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleDisplay(snapshot.data) ;
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return Center(child: SizedBox(
                height: 150,
                width: 140,
                child : CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(
                  Colors.amber),))
                  ,)
              ;
            },
          );
  }
  Widget _buildStateData(Future<List<CovidDetail>> statedet ,BuildContext context) {
    return FutureBuilder<List<CovidDetail>>(
            future: statedet,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SelectedDisplay(snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return Center(child: SizedBox(
                height: 100,
                width: 75,
                child : Text('Loading',
                style: Theme.of(context).textTheme.body2,),));
            },
          );
  }
}