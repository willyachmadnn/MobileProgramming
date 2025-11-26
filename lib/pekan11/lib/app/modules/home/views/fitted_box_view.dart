import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class FittedBoxView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fitted Box")),
      body: Container(
        width: 200,
        height: 100,
        color: Colors.amber,
        child: Center(
          child: FittedBox(
            child: Text(
              "HALOOOooo0000",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}