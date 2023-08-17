import 'package:db_miner/views/screens/homePage.dart';
import 'package:db_miner/views/screens/splashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void main(){
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    getPages: [
      GetPage(name: "/", page: () => SplashScreen(),),
      GetPage(name: "/home", page: () => HomePage(),),
    ],
  ),);
}