import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MakananScreen extends StatefulWidget {
  const MakananScreen({super.key});

  @override
  State<MakananScreen> createState() => _MakananScreenState();
}

class _MakananScreenState extends State<MakananScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Makanan"),
      ),
      body: Column(
        children: [
          Container(
            child: Text("Makanan 1"),
          ),
          Container(
            child: Text("Makanan 2"),
          ),
          Container(
            child: Text("Makanan 3"),
          ),
        ],
      ),
    );
  }
}
