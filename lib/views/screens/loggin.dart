import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';
import '../widgets/loginform.dart';
import '../widgets/signintext.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller =
        Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const  Text(
            'Welcom in GDSC' ,
            style: TextStyle(
              color: Colors.black,
              fontSize: 23,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 30, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                    "assets/images/login.png"),
                const SizedBox(height: 25),
                const AppLoginForm(),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ));
  }
}
