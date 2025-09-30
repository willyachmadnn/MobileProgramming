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
          title: Text("MyApps"),
        ),
        body: Center(child: Text("Hello Worldd!!"),),
      ),
    );
  }
}