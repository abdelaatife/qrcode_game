import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:gdsc/data.dart';
import 'package:gdsc/views/widgets/authbutton.dart';
import 'package:gdsc/views/widgets/textform.dart';
import 'package:gdsc/views/widgets/tille.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../controller/qrcodescanner_controller.dart';

class ConfirmPayment extends StatelessWidget {
  const ConfirmPayment({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    QrCodeScannerControllerImp controller =
        Get.put(QrCodeScannerControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Question Number   ',
        ),
        backgroundColor: const Color(0xFF407BFF),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body:
          GetBuilder<QrCodeScannerControllerImp>(
        init: controller,
        builder: (controller) => controller
                    .isloading ==
                true
            ? const CircularProgressIndicator()
            : Center(
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceAround,
                  children: [
                    CircularCountDownTimer(
                      duration: 20,
                      initialDuration: 0,
                      controller:
                          CountDownController(),
                      width: 80,
                      height: 80,
                      ringColor:
                          Colors.grey[300]!,
                      fillColor:
                          Color.fromARGB(255, 151, 210, 241),
                      backgroundColor:
                          Color.fromARGB(255, 22, 87, 184),
                      backgroundGradient: null,
                      strokeWidth: 10,
                      strokeCap: StrokeCap.round,
                      textStyle: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontWeight:
                              FontWeight.bold),
                      textFormat:
                          CountdownTextFormat.S,
                      isReverse: false,
                      isReverseAnimation: false,
                      isTimerTextShown: true,
                      autoStart: true,
                      onComplete: () {
                        Get.snackbar(
                          'Time Out',
                          'Time Out',
                          snackPosition:
                              SnackPosition
                                  .TOP,
                          backgroundColor:
                              Colors.red,
                          colorText:
                              Colors.white,
                        );
                   
                      controller.timeOut();
                      
                      },
                    ),
                    Text(
                      data[controller.value!]
                          .text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight.w500,
                      ),
                    ),
                    Padding(
                        padding:
                            const EdgeInsets.all(
                                15),
                        child: Column(
                          children: [
                            AppTile(
                                text: data[
                                        controller
                                            .value!]
                                    .options[0]
                                    .text,
                                onTap: () {
                                  controller
                                      .answer = data[
                                          controller
                                              .value!]
                                      .options[0]
                                      .isCorrect;
                                  controller
                                      .validtor();
                                },
                                icon: Ionicons
                                    .radio_button_off_outline),
                            AppTile(
                                text: data[
                                        controller
                                            .value!]
                                    .options[1]
                                    .text,
                                onTap: () {
                                  controller
                                      .answer = data[
                                          controller
                                              .value!]
                                      .options[1]
                                      .isCorrect;
                                  controller
                                      .validtor();
                                },
                                icon: Ionicons
                                    .radio_button_off_outline),
                            AppTile(
                                text: data[
                                        controller
                                            .value!]
                                    .options[2]
                                    .text,
                                onTap: () {
                                  controller
                                      .answer = data[
                                          controller
                                              .value!]
                                      .options[2]
                                      .isCorrect;
                                  controller
                                      .validtor();
                                },
                                icon: Ionicons
                                    .radio_button_off_outline),
                          ],
                        )),
                  ],
                ),
              ),
      ),
    );
  }
}
