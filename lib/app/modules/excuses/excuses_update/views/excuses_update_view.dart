import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/excuses_update_controller.dart';

class ExcusesUpdateView extends GetView<ExcusesUpdateController> {
  const ExcusesUpdateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExcusesUpdateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ExcusesUpdateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
