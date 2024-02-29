import 'package:dashbord/common_ui/common_ui.color.dart';
import 'package:dashbord/common_ui/common_ui.font_style.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool stretch;
  final Color? backgroundColor;

  AppButton({
    required this.label,
    required this.onPressed,
    this.stretch = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: stretch ? double.infinity : null,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColor.greenColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyles.font14Medium.copyWith(
            color: AppColor.whiteColor,
          ),
        ),
      ),
    );
  }
}
