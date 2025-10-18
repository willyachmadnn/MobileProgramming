import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuItemBeranda extends StatelessWidget {
  final String kategori;
  final String imagePath;
  const MenuItemBeranda({super.key, required this.kategori,  required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 300,
            child: Image.asset(imagePath, fit: BoxFit.cover,),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              
            ),
            alignment: Alignment.center,
          ),
          SizedBox(height: 10),
          Text(
            kategori,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
    ;
  }
}
