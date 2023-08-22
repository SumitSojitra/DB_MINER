import 'package:db_miner/model/model.dart';
import 'package:db_miner/views/utils/helper/helper.dart';
import 'package:flutter/material.dart';

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
      body: FutureBuilder(
        future: QuotesApiHelper.quotesApiHelper.getApi(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            List<QuotesModel>? data = snapshot.data;
            return Container(
              height: 100,
              color: Colors.red,
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
