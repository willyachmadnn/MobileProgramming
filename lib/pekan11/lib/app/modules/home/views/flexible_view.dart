import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class FlexibleView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    double heightDevice = MediaQuery.of(context).size.height;
    double paddingTop = MediaQuery.of(context).padding.top;

    AppBar myAppBar() {
      return AppBar(title: Text("Flexible"));
    }

    double heightBody = heightDevice - myAppBar().preferredSize.height - paddingTop;

    return Scaffold(
      appBar: myAppBar(),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              width: widthDevice * 0.5,
              height: heightBody * 0.5,
              color: Colors.red,
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              width: widthDevice * 0.5,
              height: heightBody * 0.3,
              color: Colors.amber,
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              width: widthDevice * 0.5,
              height: heightBody * 0.2,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}