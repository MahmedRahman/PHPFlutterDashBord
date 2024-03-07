import 'package:dashbord/common_ui/common_ui.color.dart';
import 'package:dashbord/common_ui/common_ui.font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  AppTextFormField({
    required this.label,
    required this.hintText,
    required this.onChanged,
    this.controller,
    this.validator,
    this.gapBetween,
    this.inputFormatters,
    this.autofillHints,
    this.keyboardType,
    super.key,
  });
  final double? gapBetween;
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final void Function(String)? onChanged;
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
        TextFormField(
          controller: controller,
          validator: validator,
          autofillHints: autofillHints,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          //onChanged: onChanged,
          //onSaved: onChanged,
          onSaved: (newValue) {
            onChanged!(newValue!);
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
            filled: true,
            fillColor: AppColor.textFormFieldFillColor,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.noColor,
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
        ),
      ],
    );
  }
}
