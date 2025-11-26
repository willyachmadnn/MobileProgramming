import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class ExpandedView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expanded")),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                color: Colors.green,
              ),
              Expanded(
                child: ListTile(
                  tileColor: Colors.amber,
                  leading: Icon(Icons.abc_sharp),
                  title: Text("JUDUL"),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}