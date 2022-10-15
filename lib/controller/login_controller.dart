import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc/data.dart';
import 'package:gdsc/views/screens/grcodescanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

abstract class LoginController
    extends GetxController {
  login();
  validator();
  uploaddata();
  late bool isloading = false;
  FirebaseFirestore firestore =
      FirebaseFirestore.instance;
  late UserCredential credential;
}

class LoginControllerImp extends LoginController {
  late TextEditingController name;
  late TextEditingController email;

  @override
  login() async {
    try {
      credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email.text,
        password: '${name.text}1234.zerè-_è56',
      );
      uploaddata();
    } on FirebaseAuthException catch (e) {
      isloading = false;
      update();
      if (e.code == 'weak-password') {
      } else if (e.code ==
          'email-already-in-use') {
        Get.snackbar(
          'Email already in use',
          'The account already exists for that email.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      isloading = false;
      update();
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  validator() {
   
    isloading = true;
    update();
    if (email.text.isEmpty || name.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      login();
    }
  }

  @override
  uploaddata() {
    firestore
        .collection('users')
        .doc(credential.user!.uid)
        .set({
      'full_name': name.text,
      'email': email.text,
       "points": 0,
       
      'dateinscription': DateTime.now()
    },  );
    Get.off(const QrCodeScanner());
  }
}
