import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/excuses_show_controller.dart';

class ExcusesShowView extends GetView<ExcusesShowController> {
  const ExcusesShowView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExcusesShowView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ExcusesShowView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
