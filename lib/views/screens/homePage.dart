import 'dart:convert';

import 'package:db_miner/views/utils/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getApi() async {
    await QuotesApiHelper.quotesApiHelper.getApi();
  }

  @override
  void initState() {
    super.initState();
    getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes App"),
      ),
      backgroundColor: Colors.grey,
      body: FutureBuilder(
        future: rootBundle.loadString("lib/views/utils/josn/quotes.json"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!;
            var decodedData = jsonDecode(data);
            List myData = decodedData['quotes'];
            List<QuotesModel> post =
                myData.map((e) => QuotesModel.fromMap(data: e)).toList();

            return ListView.builder(
              itemCount: post.length,
              itemBuilder: (context, index) => Column(
                children: [
                  SizedBox(height: 20,),
                  Container(
                  padding: EdgeInsets.all(16),
                  height: 200,
                  width: 500,
                  decoration: BoxDecoration(color: Colors.black87),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "''${post[index].quotes}''",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),]
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
