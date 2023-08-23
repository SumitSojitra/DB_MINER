import 'package:db_miner/views/screens/homePage.dart';
import 'package:db_miner/views/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      getPages: [
        GetPage(
          name: "/",
          page: () => SplashScreen(),
        ),
        GetPage(
          name: "/home",
          page: () => HomePage(),
        ),
      ],
    ),
  );
}
