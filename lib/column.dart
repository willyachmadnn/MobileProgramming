import 'package:flutter/material.dart';

void main() {
  runApp(MyAplikasi());
}

class MyAplikasi extends StatelessWidget {
  const MyAplikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text("MyApps"),
        ),
        body: Column(
          children: [
            Container(
              width: 90,
              height: 90,
              color: Colors.red,
              child: Text("1"),
            ),
            Container(
              width: 90,
              height: 90,
              color: Colors.yellow,
              child: Text("2"),
            ),
            Container(
              width: 90,
              height: 90,
              color: Colors.pink,
              child: Text("3"),
            ),
          ],
        ),
      ),
    );
  }
}