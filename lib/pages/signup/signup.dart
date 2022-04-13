import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:jcc_final_project/route/route_name.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  registerSubmit() async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
              email: _emailController.text.toString().trim(),
              password: _passwordController.text)
          .then((value) => Get.offNamed(RouteName.signin));
    } catch (e) {
      print(e);
      SnackBar(content: Text(e.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('assets/img/cat.png'),
              width: 150,
              margin: EdgeInsets.only(bottom: 15),
            ),
            Text(
              'EngIngApp',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF44B872)),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: 'email',
                        labelStyle: TextStyle(color: const Color(0xFF8E8E8E)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'password',
                        labelStyle: TextStyle(color: const Color(0xFF8E8E8E)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.toNamed(RouteName.signin);
                          },
                          child: Text('Back',
                              style: TextStyle(color: const Color(0xFF44B872))),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFFE2FFEE))),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            registerSubmit();
                          },
                          child: Text('SIGN UP',
                              style: TextStyle(color: const Color(0xFFE2FFEE))),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFF44B872))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
