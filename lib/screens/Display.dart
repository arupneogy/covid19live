import 'package:covid19live/model/covidDetail.dart';
import 'package:flutter/material.dart';

import 'StateDetails.dart';
class SingleDisplay extends StatelessWidget{
  final CovidDetail covstat;
  SingleDisplay(this.covstat);
  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _renderTitle(context,covstat.name),
        _renderBody(context,'Total Cases',covstat.totcases),
        _renderBody(context,'Active Cases',covstat.activecases),
        _renderBody(context,'Total Deaths',covstat.deaths),
        _renderBody(context,'Discharged',covstat.discharged),

      ],
    );
  }
  Widget _renderTitle(BuildContext context,String text){
      return  
      Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(),
      child: Text(text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.title,
      ),

    );
  }
  Widget _renderBody(BuildContext context,String text,int n){
      return Container(
      padding: EdgeInsets.all(3),
      margin: EdgeInsets.all(3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Text(text,
      style: Theme.of(context).textTheme.body1,
      ),
          Text(n.toString(),
        style: Theme.of(context).textTheme.body2,
      ),
        ] 
      )    
    );
  }
}
 class SelectedDisplay extends StatefulWidget {
   final List<CovidDetail> covstatlst;
   SelectedDisplay(this.covstatlst);
   @override
   _SelectedDisplayState createState() => _SelectedDisplayState();
 }
 
 class _SelectedDisplayState extends State<SelectedDisplay> {
   final TextEditingController controller = new TextEditingController();
   String filter;
   var dupList=new List<CovidDetail>();
   var stateList=new List<CovidDetail>();
   @override
  void initState() {
    // TODO: implement initState
    stateList.addAll(this.widget.covstatlst);
    dupList.addAll(stateList);
    super.initState();
  }
  void filterSearch(String query){
    if (query.isNotEmpty){
      var filterList=new List<CovidDetail>();
      for(var str in dupList){
        if(str.name.toLowerCase().contains(query.toLowerCase())){
            filterList.add(str);
        }
      }
      setState(() {
        stateList.clear();
        stateList.addAll(filterList);
      });
    }
    else{
      setState(() {
        stateList.clear();
        stateList.addAll(dupList);
      });
    }
  }
   @override
   Widget build(BuildContext context) {
     return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
       children: <Widget>[
         Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearch(value);
                },
                controller: controller,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search your state",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
            //Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: stateList.length,
                itemBuilder: (context, index) { 
                  return ListTile(
                    title: Text('${stateList[index].name}',
                    style: Theme.of(context).textTheme.body2),
                    onTap :() => _navigateState(context,stateList[index])
                  );
                },
              ),
            ),
     ],) ;
  }
  void _navigateState(BuildContext context,CovidDetail cov){
    Navigator.push(context, MaterialPageRoute(
                    builder: (context) => StateDetails(cov)
                  ));
}
}