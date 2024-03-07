import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          Row(
            children: [
              cardItem(),
            ],
          ),
          Row(
            children: [
              cardItem(),
              cardItem(),
              cardItem(),
              cardItem(),
            ],
          ),
          Row(
            children: [
              cardItem(),
              cardItem(),
              cardItem(),
              cardItem(),
            ],
          ),
          Row(
            children: [
              cardItem(),
              cardItem(),
            ],
          )
        ],
      ),
    );
  }

  Expanded cardItem() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Card(
          child: Container(
            height: 150,
            color: Colors.white10,
          ),
        ),
      ),
    );
  }
}
