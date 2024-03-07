import 'package:flutter/material.dart';

class APPEmptyPage extends StatelessWidget {
  APPEmptyPage({
    this.title = "No Data Found.",
  });

  String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "$title",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
