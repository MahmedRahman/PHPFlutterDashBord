import 'package:dashbord/common_ui/common_ui.color.dart';
import 'package:dashbord/common_ui/common_ui.font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

DateTime firstDate = DateTime(2020, 1, 1);
DateTime lastDate = DateTime(2030, 12, 31);

class AppInputDatePickerFormField extends StatelessWidget {
  AppInputDatePickerFormField({
    required this.label,
    required this.hintText,
    required this.onChanged,
    required this.initialDate,
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

  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  DateTime? initialDate;
  Function(DateTime)? onChanged;
  String? itemsValues;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyles.font14Medium.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        InputDatePickerFormField(
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate,
          onDateSubmitted: (date) {},
        ),
      ],
    );
  }
}
