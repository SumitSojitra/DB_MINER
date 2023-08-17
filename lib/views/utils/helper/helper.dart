
import 'dart:convert';

import 'package:db_miner/model/model.dart';
import 'package:http/http.dart' as http;

class QuotesApiHelper {
  QuotesApiHelper._();

  static QuotesApiHelper quotesApiHelper = QuotesApiHelper._();

  getApi() async{
    http.Response response = await http.get(Uri.parse("https://zenquotes.io/api/quotes"),);

    if(response==200){
      Map decodedData = jsonDecode(response.body);

     QuotesModel post=  QuotesModel.fromMap(data: decodedData);
      print("====================");
      print("${response}");
      print("====================");
      return post;
    }
    return null;
  }
}