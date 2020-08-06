import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
class HtmlLoad {
  static Future<Document> fetchData() async{
    final response =await http.Client().get(Uri.parse('https://www.mohfw.gov.in/'));
    if (response.statusCode == 200) {
        Future.delayed(const Duration(seconds: 10));
        Document rawDoc= parse(response.body);
        return rawDoc;
    }
  else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Exams');
  }
 }
}
