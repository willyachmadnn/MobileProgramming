import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class WrapView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text("Wrap")),
      body: Wrap(
        direction: Axis.vertical,
        children: List.generate(8, (index) {
          return Container(
            margin: EdgeInsets.all(10),
            width: widthDevice * 0.15,
            height: 35,
            color: Colors.amber,
          );
        }),
      ),
    );
  }
}