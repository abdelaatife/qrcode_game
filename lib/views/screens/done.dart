import 'package:flutter/material.dart';
 import 'package:gdsc/views/screens/grcodescanner.dart';
import 'package:gdsc/views/widgets/authbutton.dart';
import 'package:get/get.dart';

class Done extends StatelessWidget {
  const Done({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/done.png'),
            Padding(
              padding: const EdgeInsets.all(15),
              child: AppCustomAuthButton(
                  text: 'Scan Again',
                  onPressed: () {
                    
                    Get.offAll(
                        const QrCodeScanner());
                  },
                  color: const  Color.fromARGB(
                      255, 54, 109, 219)),
            )
          ],
        ),
      ),
    );
  }
}
