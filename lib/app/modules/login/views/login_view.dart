import 'package:dashbord/app/routes/app_pages.dart';
import 'package:dashbord/components/components.button.dart';
import 'package:dashbord/components/components.form_field.dart';
import 'package:dashbord/generic/app_input_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx((snapshot) {
        return Row(
          children: [
            Expanded(
              child: Container(
                height: Get.height,
                decoration: BoxDecoration(color: Color(0xff0693e3)),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      "assets/svg/logo.svg",
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: controller.formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      AppTextFormField(
                        controller: controller.email,
                        hintText: 'Email',
                        label: "Email",
                        validator: APPInputValidator.validateEmail,
                        onChanged: (data) {
                          controller.email.text = data.toString();
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AppTextFormField(
                        controller: controller.password,
                        hintText: 'Password',
                        label: "Password",
                        onChanged: (data) {
                          controller.password.text = data.toString();
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              label: "Login",
                              onPressed: controller.onPressedLoginButton,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: AppButton(
                              label: "Register",
                              onPressed: controller.onPressedRegisterButton,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
