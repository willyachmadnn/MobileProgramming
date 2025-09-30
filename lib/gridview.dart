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
        body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          padding: const EdgeInsets.all(10.0),
          children: [
            Container(
              color: Colors.yellow,
              child: const Center(child: Text("1")),
            ),
            Container(
              color: Colors.pink,
              child: const Center(child: Text("2")),
            ),
            Container(
              color: Colors.red,
              child: const Center(child: Text("3", style: TextStyle(color: Colors.white))),
            ),
            Container(
              color: Colors.purple,
              child: const Center(child: Text("4", style: TextStyle(color: Colors.white))),
            ),
            Container(
              color: Colors.blue,
              child: const Center(child: Text("5", style: TextStyle(color: Colors.white))),
            ),
            Container(
              color: Colors.green,
              child: const Center(child: Text("6")),
            ),
            Container(
              color: Colors.teal,
              child: const Center(child: Text("7", style: TextStyle(color: Colors.white))),
            ),
            Container(
              color: Colors.brown,
              child: const Center(child: Text("8")),
            ),
            Container(
              color: Colors.blueGrey,
              child: const Center(child: Text("9", style: TextStyle(color: Colors.white))),
            ),
            Container(
              color: Colors.grey,
              child: const Center(child: Text("10", style: TextStyle(color: Colors.white))),
            ),
            Container(
              color: Colors.cyan,
              child: const Center(child: Text("11")),
            ),
            Container(
              color: Colors.pinkAccent,
              child: const Center(child: Text("12", style: TextStyle(color: Colors.white))),
            ),
          ],
        ),
      ),
    );
  }
}