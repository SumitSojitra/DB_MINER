import 'dart:convert';

import 'package:db_miner/model/model.dart';
import 'package:http/http.dart' as http;

class QuotesApiHelper {
  QuotesApiHelper._();

  static QuotesApiHelper quotesApiHelper = QuotesApiHelper._();

  Future<List<QuotesModel>?> getApi() async {
    http.Response response = await http.get(
      Uri.parse("https://dummyjson.com/quotes"),
    );

    if (response == 200) {
      var decodedData = jsonDecode(response.body);

      List apiData = decodedData['quotes'];
      List<QuotesModel> post =
          apiData.map((e) => QuotesModel.fromMap(data: e)).toList();

      print("====================");
      print("${response}");
      print("====================");
      return post;
    }
    return null;
  }
}
