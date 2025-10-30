import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();

  String hasilResponse = "Belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP PUT / PATCH"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: jobC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Job",
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () async {
              try {
                String nameInput = nameC.text;
                String jobInput = jobC.text;
                setState(() {
                  hasilResponse =
                  "Data berhasil diupdate!\nName : $nameInput\nJob : $jobInput";
                });
                try {
                  var myresponse = await http.put(
                    Uri.parse("https://reqres.in/api/users/2"),
                    headers: {
                      "Content-Type": "application/json",
                    },
                    body: json.encode({
                      "name": nameInput,
                      "job": jobInput,
                    }),
                  );
                  print("Status code: ${myresponse.statusCode}");
                  print("Response body: ${myresponse.body}");
                } catch (e) {
                  print("API Error: $e");
                }
              } catch (e) {
                print("Error: $e");
                setState(() {
                  hasilResponse = "Terjadi kesalahan: $e";
                });
              }
            },
            child: const Text("SUBMIT"),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              hasilResponse,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
