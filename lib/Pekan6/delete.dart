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
  String data = "belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP DELETE"),
        actions: [
          IconButton(
            onPressed: () async {
              var headers = {
                'Content-Type': 'application/json',
                'X-API-Key':
                    'your-api-key-here',
              };

              try {
                var response = await http.get(
                  Uri.parse("https://reqres.in/api/users/2"),
                  headers: headers,
                );

                if (response.statusCode == 200) {
                  Map<String, dynamic> mybody = json.decode(response.body);
                  print(mybody);
                  setState(() {
                    data =
                        "Akun : ${mybody['data']['first_name']} ${mybody['data']['last_name']}";
                  });
                } else {
                  print("Error: ${response.statusCode}");
                  setState(() {
                    data = "Gagal mengambil data: ${response.statusCode}";
                  });
                }
              } catch (e) {
                print("Exception: $e");
                setState(() {
                  data = "Error: $e";
                });
              }
            },
            icon: Icon(Icons.get_app),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(data),
          SizedBox(height: 35),
          ElevatedButton(
            onPressed: () async {
              try {
                setState(() {
                  data = "Berhasil menghapus data";
                });
                try {
                  var response = await http.delete(
                    Uri.parse("https://reqres.in/api/users/2"),
                    headers: {
                      'Content-Type': 'application/json',
                    },
                  );
                  print("Status code: ${response.statusCode}");
                  print("Response body: ${response.body}");
                } catch (e) {
                  print("API Error: $e");
                }
              } catch (e) {
                print("Exception: $e");
                setState(() {
                  data = "Error: $e";
                });
              }
            },
            child: Text("DELETE"),
          ),
        ],
      ),
    );
  }
}
