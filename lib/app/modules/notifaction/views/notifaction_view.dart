import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notifaction_controller.dart';

class NotifactionView extends GetView<NotifactionController> {
  const NotifactionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotifactionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NotifactionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
