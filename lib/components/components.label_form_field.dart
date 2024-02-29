import 'package:dashbord/common_ui/common_ui.color.dart';
import 'package:dashbord/common_ui/common_ui.font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLabelFormField extends StatelessWidget {
  AppLabelFormField({
    required this.label,
    required this.hintText,
  });

  final String label;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyles.font14Medium,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          hintText,
          style: TextStyles.font14Medium,
        ),
      ],
    );
  }
}
