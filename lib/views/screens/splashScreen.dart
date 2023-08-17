import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),(){
      Get.toNamed('/home');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: Container(
          height: 200,width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image:AssetImage("assets/images/logo.png") ,fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
