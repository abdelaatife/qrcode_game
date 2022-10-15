import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gdsc/data.dart';
import 'package:gdsc/views/screens/done.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../views/screens/confirmpayment.dart';

abstract class QrCodeScannerController
    extends GetxController {
  final GlobalKey qrKey =
      GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;
  int? value;
  String userId =
      FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore db =
      FirebaseFirestore.instance;

  bool? answer;
  int? points;
 
  onQRViewCreated(QRViewController controller);
  confirmPayment();

  late bool isloading = false;
  validtor();
  timeOut();
}

class QrCodeScannerControllerImp
    extends QrCodeScannerController {
  @override
  onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.resumeCamera();
    controller.scannedDataStream
        .listen((scanData) {
      barcode = scanData;
      value = int.parse(barcode!.code!) - 1;
      update();

      controller.pauseCamera();

      Get.to(
        () => const ConfirmPayment(),
        duration:
            const Duration(milliseconds: 500),
        transition: Transition.downToUp,
      );
    });
  }

  @override
  confirmPayment() {
    CollectionReference users = FirebaseFirestore
        .instance
        .collection('users')
        .doc(userId)
        .collection('answers');

    isloading = true;
    update();

    try {
      db.collection('users').doc(userId).update(
        {
          "points": FieldValue.increment(points!),
        },
      );
      users.add({
        'questionId': data[value!].text,
        'question number': value,
        'time': DateTime.now(),
      }).then((value) => Get.snackbar(
          "successful Submit your answer ",
          "your answer is ${answer} ",
          backgroundColor: answer == true
              ? Colors.green
              : Colors.red,
          duration: const Duration(seconds: 4),
          colorText: Colors.white));
      isloading = false;
      update();
      Get.to(() => const Done());
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  validtor() {
    points = 0;
    if (answer!) {
      points = 1;
    } else {
      points = 0;
    }

    confirmPayment();
  }

  @override
  timeOut() {
    db.collection('users').doc(userId).set({
      "timeout": 'true',
    }, SetOptions(merge: true));
    isloading = false;
    update();
    Get.to(() => const Done());
  }
}
