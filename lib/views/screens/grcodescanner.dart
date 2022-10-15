import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../controller/qrcodescanner_controller.dart';

class QrCodeScanner extends StatelessWidget {
  const QrCodeScanner({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    QrCodeScannerControllerImp controller =
        Get.put(QrCodeScannerControllerImp());

    return GetBuilder<QrCodeScannerControllerImp>(
        init: controller,
        builder: ((controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueAccent,
              title: const Text(
                'Scan Your Question',
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                
               
                children: <Widget>[
                  SizedBox(
                    height: Get.height * 0.15,
                  ),
                  Container(
                    width: Get.width * 0.8,
                    height: Get.height * 0.4,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(
                              10),
                    ),
                    child: InkWell(
                      onTap: () {
                        controller.controller!.resumeCamera();
                      
                      },
                      child: QRView(
                          key: controller.qrKey,
                          onQRViewCreated:
                              controller
                                  .onQRViewCreated,
                          overlay:
                              QrScannerOverlayShape(
                                  borderRadius: 13,
                                  borderColor:
                                      Color(0xFF407BFF),
                                  borderLength: 30,
                                  borderWidth: 5,
                                  cutOutSize:
                                      Get.width *
                                          .7)),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
