import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInputTimePickerFormField extends StatelessWidget {
  AppInputTimePickerFormField({
    required this.label,
    required this.hintText,
    required this.onChanged,
    this.initialTime,
    this.validator,
    this.gapBetween = 8.0,
    this.inputFormatters,
    this.autofillHints,
    this.keyboardType,
    super.key,
  });

  final double gapBetween;
  final String label;
  final String hintText;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  TimeOfDay? initialTime;
  final Function(TimeOfDay)? onChanged;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
    );
    if (picked != null && onChanged != null) {
      onChanged!(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: gapBetween),
        GestureDetector(
          onTap: () => _selectTime(context),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  initialTime != null ? '${initialTime!.format(context)}' : hintText,
                  style: TextStyle(
                    color: initialTime != null ? Colors.black : Colors.grey,
                  ),
                ),
                Icon(Icons.access_time, size: 24.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
