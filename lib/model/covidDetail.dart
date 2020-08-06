class CovidDetail{
  final String name;
  final int totcases;
  final int activecases;
  final int discharged;
  final int deaths;
  CovidDetail ({this.name,this.totcases,this.activecases,this.discharged,this.deaths});
  factory CovidDetail.setDetail(String name,var active,var discharged,var  death,var total){
    return CovidDetail(name: name,
    activecases: active,
    discharged: discharged,
    deaths: death,
    totcases: total
    );
  }
}