import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/vacation_show_controller.dart';

class VacationShowView extends GetView<VacationShowController> {
  const VacationShowView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VacationShowView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VacationShowView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
