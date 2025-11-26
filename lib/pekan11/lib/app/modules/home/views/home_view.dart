import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Responsive UI Dashboard"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.MEDIA_QUERY),
              child: Text("1. Media Query"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.FLEXIBLE),
              child: Text("2. Flexible"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.EXPANDED),
              child: Text("3. Expanded"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.FITTED_BOX),
              child: Text("4. Fitted Box"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.WRAP),
              child: Text("5. Wrap"),
            ),
          ],
        ),
      ),
    );
  }
}