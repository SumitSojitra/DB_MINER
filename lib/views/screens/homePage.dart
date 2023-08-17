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

    );
  }}
