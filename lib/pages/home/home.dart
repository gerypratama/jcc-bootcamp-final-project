import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../route/route_name.dart';
import '../../controller/fcats_controller.dart';

class HomeScreen extends StatelessWidget {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      print(auth.currentUser!.email);
    }
    var controller = Get.put(CatFactsController());
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications),
                  color: const Color(0xFF44B872),
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: () {
                    auth.signOut().then((_) => Get.toNamed(RouteName.signin));
                  },
                  icon: Icon(Icons.logout),
                  color: const Color(0xFF44B872),
                  iconSize: 30,
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome,',
                    style: TextStyle(
                        color: const Color(0xFF44B872),
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'User',
                    style:
                        TextStyle(color: const Color(0xFF8E8E8E), fontSize: 36),
                  )
                ],
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.75,
                child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: 'Search',
                        labelStyle: TextStyle(color: const Color(0xFF8E8E8E)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.grey)))),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (() {}),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 50),
                    width: MediaQuery.of(context).size.width / 5.5,
                    height: MediaQuery.of(context).size.height / 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.account_circle_outlined,
                            color: const Color(0xFF44B872), size: 58),
                        Text(
                          'My\nProfile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color(0xFF44B872), fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (() {
                    Get.toNamed(RouteName.activity);
                  }),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 50),
                    width: MediaQuery.of(context).size.width / 5.5,
                    height: MediaQuery.of(context).size.height / 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.lightbulb_outline,
                            color: const Color(0xFF44B872), size: 58),
                        Text(
                          'Activity\nIdea',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color(0xFF44B872), fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (() {}),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 50),
                    width: MediaQuery.of(context).size.width / 5.5,
                    height: MediaQuery.of(context).size.height / 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.settings_outlined,
                            color: const Color(0xFF44B872), size: 58),
                        Text(
                          'App\nSettings',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color(0xFF44B872), fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (() {
                    Get.toNamed(RouteName.about);
                  }),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 50),
                    width: MediaQuery.of(context).size.width / 5.5,
                    height: MediaQuery.of(context).size.height / 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.info_outlined,
                            color: const Color(0xFF44B872), size: 58),
                        Text(
                          'About\nApp',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: const Color(0xFF44B872), fontSize: 18),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daily Fcats',
                    style:
                        TextStyle(color: const Color(0xFF44B872), fontSize: 32),
                  ),
                  Text(
                    '(Oh, did I misspell?)',
                    style:
                        TextStyle(color: const Color(0xFF8E8E8E), fontSize: 16),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  Text(
                    'Do you know?',
                    style: TextStyle(
                        color: const Color(0xFF8E8E8E),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Obx(() => controller.factloading.value
                      ? CircularProgressIndicator(
                          color: const Color(0xFF44B872))
                      : Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            controller.catFacts.fact!,
                            style: TextStyle(
                                color: const Color(0xFF8E8E8E), fontSize: 18),
                          ),
                        )),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
