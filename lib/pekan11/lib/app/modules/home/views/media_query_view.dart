import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class MediaQueryView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    double heightDevice = MediaQuery.of(context).size.height;
    double paddingTop = MediaQuery.of(context).padding.top;
    double paddingBottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: AppBar(title: Text("Media Query")),
      body: Container(
        margin: EdgeInsets.only(top: paddingTop, bottom: paddingBottom),
        width: widthDevice * 0.5,
        height: heightDevice,
        color: Colors.red,
      ),
    );
  }
}