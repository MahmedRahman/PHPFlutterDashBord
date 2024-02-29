import 'package:dashbord/common_ui/common_ui.color.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    useMaterial3: false,
    // scaffoldBackgroundColor: scaffoldBg,
    fontFamily: "ExpoArabic",
    // appBarTheme: appBarTh eme(),

    // inputDecorationTheme: appInputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecoration borderWithLabel(String label) {
  InputDecoration inputDecoration =
      InputDecoration(enabledBorder: borderWithLabelTheme().enabledBorder, labelText: label);
  return inputDecoration;
}

InputDecorationTheme borderWithLabelTheme() {
  InputBorder inputBorder = OutlineInputBorder(borderSide: BorderSide(color: AppColor.greyColor, width: 2.0));
  return InputDecorationTheme(
      // If  you are using latest version of flutter then lable text and hint text shown like this
      // if you r using flutter less then 1.20.* then maybe this is not working properly
      // if we are define our floatingLabelBehavior in our theme then it's not applayed
      focusColor: AppColor.greyColor,
      labelStyle: TextStyle(color: AppColor.greyColor),
      suffixStyle: TextStyle(
        color: AppColor.greyColor,
      ),
      focusedBorder: inputBorder,
      enabledBorder: inputBorder
      // floatingLabelBehavior: FloatingLabelBehavior.auto,
      // contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      );
}
