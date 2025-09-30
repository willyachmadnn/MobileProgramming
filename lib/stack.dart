import 'package:flutter/material.dart';

void main() {
  runApp(const MyAplikasi());
}

class MyAplikasi extends StatelessWidget {
  const MyAplikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: const Text("MyApps"),
        ),
        body: Stack(

          children: [
            Container(
              width: 125,
              height: 125,
              color: Colors.red,
              child: const Text("1"),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
              child: const Text("2"),
            ),
            Container(
              width: 75,
              height: 75,
              color: Colors.pink,
              child: const Text("3"),
            ),
          ],
        ),
      ),
    );
  }
}