import 'package:flutter/material.dart';
import 'package:get/get.dart';

class APPLabel extends StatelessWidget {
  APPLabel({
    required this.title,
    required this.subTitle,
  });
  String title;
  String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      height: 50,
      width: Get.width,
      child: Row(
        children: [
          SizedBox(
            width: 5,
          ),
          Text(title.toString()),
          Spacer(),
          Text(subTitle.toString()),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}
