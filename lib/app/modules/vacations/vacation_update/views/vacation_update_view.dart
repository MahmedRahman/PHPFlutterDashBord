import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/vacation_update_controller.dart';

class VacationUpdateView extends GetView<VacationUpdateController> {
  const VacationUpdateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VacationUpdateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VacationUpdateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
