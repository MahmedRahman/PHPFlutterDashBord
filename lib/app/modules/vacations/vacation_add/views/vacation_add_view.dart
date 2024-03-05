import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/vacation_add_controller.dart';

class VacationAddView extends GetView<VacationAddController> {
  const VacationAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VacationAddView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VacationAddView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
