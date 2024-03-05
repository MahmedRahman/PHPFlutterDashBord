import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/excuses_add_controller.dart';

class ExcusesAddView extends GetView<ExcusesAddController> {
  const ExcusesAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExcusesAddView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ExcusesAddView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
