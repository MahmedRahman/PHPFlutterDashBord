import 'package:dashbord/common_ui/common_ui.color.dart';
import 'package:dashbord/common_ui/common_ui.font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppDropdownFormField extends StatelessWidget {
  AppDropdownFormField({
    required this.label,
    required this.hintText,
    this.validator,
    this.gapBetween,
    this.inputFormatters,
    this.autofillHints,
    this.keyboardType,
    this.items,
    this.itemsValues,
    this.onChanged,
    super.key,
  });
  final double? gapBetween;
  final String label;
  final String hintText;

  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  void Function(String?)? onChanged;
  final List<DropdownMenuItem<String>>? items;
  String? itemsValues;
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
        DropdownButtonFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.greyColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.greyColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.greenColor,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.redColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.redColor,
              ),
            ),
          ),
          validator: validator,
          value: itemsValues,
          items: items,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
