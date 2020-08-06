import 'package:covid19live/model/covidDetail.dart';
import 'package:flutter/material.dart' ;

import 'Display.dart';

class StateDetails extends StatefulWidget {
  final CovidDetail covsdet;
  StateDetails(this.covsdet);
  @override
  _StateDetailsState createState() => _StateDetailsState();
}

class _StateDetailsState extends State<StateDetails> {
  CovidDetail covstat;
  @override
  void initState() {
    super.initState();
     _reLoad();
  }
  Future<void>  _reLoad() async{
    setState(() {
      covstat=this.widget.covsdet;
    });
  }
  Widget build(BuildContext context) {
      return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text('${covstat.name} Covid19 Stats',
      style: Theme.of(context).textTheme.headline,)
        ),
        body: ListView(
              children: <Widget>[
                  SingleDisplay(covstat),
              ]
                ),
         ),
    ) ;
  }

}