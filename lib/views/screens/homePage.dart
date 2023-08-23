import 'dart:convert';

import 'package:card_swiper/card_swiper.dart';
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
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1547582155-b3537b148bae?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTJ8NjM3MzA1fHxlbnwwfHx8fHw%3D&w=1000&q=80"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Container(
                  height: 50,
                  child: Text(
                    "QUOTES APP",
                    style: TextStyle(fontSize: 24, color: Colors.cyan),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: FutureBuilder(
                  future:
                      rootBundle.loadString("lib/views/utils/josn/quotes.json"),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data!;
                      var decodedData = jsonDecode(data);
                      List myData = decodedData['quotes'];
                      List<QuotesModel> post = myData
                          .map((e) => QuotesModel.fromMap(data: e))
                          .toList();

                      return Swiper(
                        itemCount: post.length,
                        loop: false,
                        index: 0,
                        itemWidth: 300.0,
                        layout: SwiperLayout.STACK,
                        itemBuilder: (context, index) => SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 180,
                              ),
                              Container(
                                height: 300,
                                width: 300,
                                decoration: BoxDecoration(
                                    // color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://images.unsplash.com/photo-1487088678257-3a541e6e3922?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXwxOTc3MzAyfHxlbnwwfHx8fHw%3D&w=1000&q=80"),
                                        fit: BoxFit.cover)),
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "''${post[index].quotes}''",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          "''- ${post[index].Auther}''",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        pagination:
                            SwiperPagination(alignment: Alignment.bottomCenter),
                        control: SwiperControl(),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
