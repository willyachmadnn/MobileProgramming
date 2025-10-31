import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;
  void increment() {
    counter++;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("State Management Example")),
        body: Column(
          children: [
            StatelessExample(),
            StatefulExample(),
            GetXExample(),
          ],
        ),
      ),
    );
  }
}

class StatelessExample extends StatelessWidget {
  const StatelessExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Helloww from Stateless Widget"),
    );
  }
}
class StatefulExample extends StatefulWidget {
  const StatefulExample({super.key});

  @override
  State<StatefulExample> createState() => _StatefulExampleState();
}

class _StatefulExampleState extends State<StatefulExample> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Counter: $counter'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          child: Text("Increment Stateful"),
        ),
      ],
    );
  }
}
class GetXExample extends StatelessWidget {
  final CounterController c = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Text('Counter: ${c.counter}')),
        ElevatedButton(
          onPressed: c.increment,
          child: Text("Increment with GetX"),
        ),
      ],
    );
  }
}