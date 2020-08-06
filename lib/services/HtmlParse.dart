import 'dart:ffi';

import 'package:html/dom.dart';
import 'dart:async';
import 'package:covid19live/model/covidDetail.dart';
class HtmlParse{
  static Future<CovidDetail> fetchNatData(Future<Document> rawDoc) async{
  
    Document doc=await rawDoc;
    var rawData=doc.getElementsByClassName('col-xs-8 site-stats-count')[0].children[0].children;
     var activestr=rawData[0].children[4].text;
     int active=int.parse(activestr.substring(0,activestr.indexOf('(')));
     var dischargedstr=rawData[1].children[4].text;
     int discharged=int.parse(dischargedstr.substring(0,dischargedstr.indexOf('(')));
     var deathsr=rawData[2].children[4].text;
     int death=int.parse(deathsr.substring(0,deathsr.indexOf('(')));
     var total=death+discharged+active;
     var  name="India";
     //print(active.toString()+" "+discharged.toString()+" "+death.toString()+" "+total.toString()+" "+name);
     //doc.getElementsByClassName('status-update')[0].children[0].text;
     return new CovidDetail.setDetail(name, active, discharged, death, total);
        }
    //static void fetchStateData(Future<Document> rawDoc) async{
    static Future<List<CovidDetail>> fetchStateData(Future<Document> rawDoc) async{
      Document doc=await rawDoc;
      var rawData=doc.getElementsByClassName('statetable table table-striped')[0].children[1].children;
      List<CovidDetail> covList=new List<CovidDetail>();
      for (int i=0;i<35;i++){
        String name=rawData[i].children[1].text;
        int active=int.parse(rawData[i].children[2].text);
        int discharge=int.parse(rawData[i].children[3].text);
        int death=int.parse(rawData[i].children[4].text);
        int tot=int.parse(rawData[i].children[5].text);
        covList.add(new CovidDetail.setDetail(name, active, discharge, death, tot));
      }
      return(covList);
    }
     
  }
  
