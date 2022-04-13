import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:jcc_final_project/route/page_routes.dart';
import 'pages/splash/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: pageRoutes.pages,
      debugShowCheckedModeBanner: false,
      title: 'EngIngApp',
      theme: ThemeData(fontFamily: 'Manjari'),
      home: const SplashScreen(),
    );
  }
}
