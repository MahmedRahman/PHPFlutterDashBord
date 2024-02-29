import 'package:flutter/services.dart';

class AppInputConfig {
  // Formatter to allow only digits
  static final digitsOnly = FilteringTextInputFormatter.digitsOnly;

  // Formatter to allow only alphanumeric characters
  static final alphanumeric = FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]'));

  // Formatter to limit the length of the input
  static LengthLimitingTextInputFormatter maxLength(int length) {
    return LengthLimitingTextInputFormatter(length);
  }

  static TextInputFormatter arabicLettersOnly() {
    return FilteringTextInputFormatter.allow(RegExp(r'[\u0600-\u06FF\s]'));
  }

  // Formatter for English letters
  static TextInputFormatter englishLettersOnly() {
    return FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'));
  }

  static TextInputFormatter arabicAndEnglishLetters() {
    return FilteringTextInputFormatter.allow(RegExp(r'[\u0600-\u06FFa-zA-Z\s]'));
  }

  static TextInputFormatter minLetters(int min) {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      if (newValue.text.length < min && newValue.text.isNotEmpty) {
        return oldValue;
      }
      return newValue;
    });
  }

  // Formatter to enforce a maximum number of characters
  static TextInputFormatter maxLetters(int max) {
    return LengthLimitingTextInputFormatter(max);
  }

  // Custom formatter example: Formatter to capitalize the first letter of each word
  static final capitalizeFirstLetterOfEachWord = TextInputFormatter.withFunction((oldValue, newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }
    if (newValue.text.length == 1) {
      return newValue.copyWith(text: newValue.text.toUpperCase());
    }
    return newValue.copyWith(
      text: newValue.text.split(' ').map((word) {
        if (word.isNotEmpty) {
          return word[0].toUpperCase() + word.substring(1);
        }
        return word;
      }).join(' '),
    );
  });

  // Add more custom formatters as needed
}
