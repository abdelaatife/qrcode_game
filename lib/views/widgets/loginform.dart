import 'package:flutter/material.dart';
import 'package:gdsc/views/widgets/authbutton.dart';
import 'package:gdsc/views/widgets/customformfield.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../controller/login_controller.dart';

class AppLoginForm extends StatelessWidget {
  const AppLoginForm({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp loginControllerImp =
        Get.put(LoginControllerImp());
    return GetBuilder<LoginControllerImp>(
        init: loginControllerImp,
        builder: ((controller) {
          return controller.isloading == true
              ? const Center(
                  child:
                      CircularProgressIndicator(),
                )
              : Form(
                  child: Column(
                  children: [
                    AppCustomFormFaild(
                      controller: controller.name,
                      keyboardType:
                          TextInputType.text,
                      lable: 'Name'.tr,
                      hint: 'Enter your name'.tr,
                      icon:
                          Ionicons.person_outline,
                      obscureText: false,
                    ),
                    AppCustomFormFaild(
                      controller:
                          controller.email,
                      keyboardType: TextInputType
                          .emailAddress,
                      obscureText: false,
                      lable: "Email",
                      hint: 'Enter your email'.tr,
                      icon: Ionicons.mail_outline,
                    ),
                    AppCustomAuthButton(
                      color: const Color(0xFF407BFF),
                      text: 'SignUp'.tr,
                      onPressed: () {
                        controller.validator();
                      },
                    ),
                  ],
                ));
        }));
  }
}
