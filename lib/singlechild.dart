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
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                width: 200,
                height: 150,
                color: Colors.pink[100],
                child: const Center(child: Text("Container 1")),
              ),
              Container(
                width: 200,
                height: 150,
                color: Colors.yellow[200],
                child: const Center(child: Text("Container 2")),
              ),
              Container(
                width: 200,
                height: 150,
                color: Colors.red[300],
                child: const Center(child: Text("Container 3")),
              ),
              Container(
                width: 200,
                height: 150,
                color: Colors.pink[400],
                child: const Center(child: Text("Container 4")),
              ),
              Container(
                width: 200,
                height: 150,
                color: Colors.yellow[500],
                child: const Center(child: Text("Container 5")),
              ),
              Container(
                width: 200,
                height: 150,
                color: Colors.red[600],
                child: const Center(child: Text("Container 6")),
              ),
              Container(
                width: 200,
                height: 150,
                color: Colors.pink[700],
                child: const Center(child: Text("Container 7")),
              ),
              Container(
                width: 200,
                height: 150,
                color: Colors.yellow[800],
                child: const Center(child: Text("Container 8")),
              ),
              Container(
                width: 200,
                height: 150,
                color: Colors.red[900],
                child: const Center(child: Text("Container 9")),
              ),
              Container(
                width: 200,
                height: 150,
                color: Colors.black,
                child: const Center(
                  child: Text("Container 10", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}