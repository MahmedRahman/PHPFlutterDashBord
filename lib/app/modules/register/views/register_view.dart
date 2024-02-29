import 'package:dashbord/components/components.button.dart';
import 'package:dashbord/components/components.form_field.dart';
import 'package:dashbord/generic/app_input_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
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
            child: controller.obx((snapshot) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: controller.formkey,
                  child: Column(
                    children: [
                      AppBar(
                        title: Text("Sign Up"),
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      AppTextFormField(
                        controller: controller.name,
                        hintText: 'Name',
                        label: "Name",
                        validator: APPInputValidator.validateFirstName,
                        onChanged: (data) {
                          controller.name.text = data.toString();
                        },
                      ),
                      SizedBox(
                        height: 19,
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
                        height: 19,
                      ),
                      AppTextFormField(
                        controller: controller.password,
                        hintText: 'Password',
                        label: "Password",
                        validator: APPInputValidator.validatePassword,
                        onChanged: (data) {
                          controller.password.text = data.toString();
                        },
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      AppButton(
                        label: "Register",
                        onPressed: controller.onPressedRegisterButton,
                        stretch: true,
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
