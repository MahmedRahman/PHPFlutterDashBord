import 'package:dashbord/common_ui/common_ui.color.dart';
import 'package:dashbord/common_ui/common_ui.font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppLabelFormField extends StatelessWidget {
  AppLabelFormField({
    required this.label,
    required this.hintText,
  });

  final String label;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Colors.grey.shade300,
          height: 50,
          width: 150,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                // textAlign: TextAlign.center,
                style: TextStyles.font14Medium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          //color: Colors.red,
          height: 50,
          child: Center(
            child: Text(
              hintText,
              style: TextStyles.font14Medium,
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
