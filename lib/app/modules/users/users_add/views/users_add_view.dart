import 'package:dashbord/components/components.button.dart';
import 'package:dashbord/components/components.Input_date_picker.dart';
import 'package:dashbord/components/components.drop_down_form_field.dart';
import 'package:dashbord/components/components.form_field.dart';
import 'package:dashbord/generic/app_input_config.dart';
import 'package:dashbord/generic/app_input_validator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/users_add_controller.dart';

class UsersAddView extends GetView<UsersAddController> {
  const UsersAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (snapshot) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: controller.formkey,
                child: Column(
                  children: [
                    AppTextFormField(
                      controller: controller.name,
                      hintText: 'Employee No',
                      label: "Employee No",
                      validator: APPInputValidator.validateFirstName,
                      onChanged: (data) {
                        controller.name.text = data.toString();
                      },
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
                    AppDropdownFormField(
                      hintText: 'role',
                      label: "Role",
                      itemsValues: "employee",
                      items: [
                        DropdownMenuItem(
                          child: Text("employee"),
                          value: "employee",
                        ),
                        DropdownMenuItem(
                          child: Text("hr"),
                          value: "hr",
                        ),
                        DropdownMenuItem(
                          child: Text("techlead"),
                          value: "techlead",
                        )
                      ],
                      onChanged: (data) {
                        controller.role.text = data!.toString();
                      },
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    AppDropdownFormField(
                      hintText: 'Status',
                      label: "Status",
                      itemsValues: "true",
                      items: [
                        DropdownMenuItem(
                          child: Text("True"),
                          value: "true",
                        ),
                        DropdownMenuItem(
                          child: Text("False"),
                          value: "false",
                        ),
                      ],
                      onChanged: (data) {
                        controller.isActive.text = data!.toString();
                      },
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    AppDropdownFormField(
                      hintText: 'Department',
                      label: "Department",
                      itemsValues: "Engineering",
                      items: [
                        DropdownMenuItem(
                          child: Text("Engineering"),
                          value: "Engineering",
                        ),
                        DropdownMenuItem(
                          child: Text("Sales and Marketing"),
                          value: "Sales and Marketing",
                        ),
                        DropdownMenuItem(
                          child: Text("Human Resources"),
                          value: "Human Resources",
                        ),
                      ],
                      onChanged: (data) {
                        controller.isActive.text = data!.toString();
                      },
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    AppDropdownFormField(
                      hintText: 'Job Title',
                      label: "Job Title",
                      itemsValues: "Front-end Developer",
                      items: [
                        DropdownMenuItem(
                          child: Text("Front-end Developer"),
                          value: "Front-end Developer",
                        ),
                        DropdownMenuItem(
                          child: Text("Back-end Developer"),
                          value: "Back-end Developer",
                        ),
                        DropdownMenuItem(
                          child: Text("Mobile Developer"),
                          value: "Mobile Developer",
                        ),
                        DropdownMenuItem(
                          child: Text("UX/UI Designer"),
                          value: "UX/UI Designer",
                        ),
                        DropdownMenuItem(
                          child: Text("HR Manager"),
                          value: "HR Manager",
                        ),
                        DropdownMenuItem(
                          child: Text("Operations Manager"),
                          value: "Operations Manager",
                        ),
                      ],
                      onChanged: (data) {
                        controller.isActive.text = data!.toString();
                      },
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    AppTextFormField(
                      controller: controller.vacationDays,
                      hintText: 'vacation_days',
                      label: "vacation_days",
                      inputFormatters: [AppInputConfig.digitsOnly],
                      onChanged: (date) {
                        controller.vacationDays.text = date.toString();
                      },
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    AppInputDatePickerFormField(
                      label: "Join Date",
                      hintText: "Join Date",
                      initialDate: DateTime.now(),
                      onChanged: (data) {
                        DateTime? date = DateTime.parse(data.toString());
                        if (date != null) {
                          // Format the date to Y-m-d format
                          String formattedDate = DateFormat('yyyy-MM-dd').format(date);
                          // Set the formatted date to the controller
                          controller.role.text = formattedDate;
                        }
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
            ),
          );
        },
      ),
    );
  }
}
