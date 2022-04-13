import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jcc_final_project/route/route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 2500), () {
      Get.offNamed(RouteName.signin);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ENG\nING\nAPP',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 54,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF44B872)),
            ),
            Text('your dream career',
                style: TextStyle(fontSize: 20, color: Colors.white)),
            Text('starts here',
                style: TextStyle(fontSize: 20, color: Colors.white))
          ],
        ),
      ),
    );
  }
}
