import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<List<UserModel>> getAllUser() async {
    try {
      print("Fetching data from ReqRes API...");

      try {
        var response = await http.get(
          Uri.parse("https://reqres.in/api/users"),
        );
        
        print("Response status code: ${response.statusCode}");
        print("Response body: ${response.body}");
        
        if (response.statusCode == 200) {
          final responseData = json.decode(response.body) as Map<String, dynamic>;
          print("Parsed response data: $responseData");
          
          final userResponse = UserResponse.fromJson(responseData);
          print("User response data length: ${userResponse.data.length}");
          
          return userResponse.data;
        } else if (response.statusCode == 401) {
          print("API memerlukan autentikasi. Menggunakan data simulasi.");
          return _getSimulatedData();
        } else {
          throw Exception('HTTP Error: ${response.statusCode} - ${response.reasonPhrase}');
        }
      } catch (e) {
        print("Error saat mengakses API: $e");
        print("Menggunakan data simulasi sebagai fallback.");
        return _getSimulatedData();
      }
    } catch (e) {
      print("Error occurred: $e");
      rethrow;
    }
  }
  List<UserModel> _getSimulatedData() {
    return [
      UserModel(
        id: 1,
        email: "george.bluth@reqres.in",
        firstName: "George",
        lastName: "Bluth",
        avatar: "https://reqres.in/img/faces/1-image.jpg",
      ),
      UserModel(
        id: 2,
        email: "janet.weaver@reqres.in",
        firstName: "Janet",
        lastName: "Weaver",
        avatar: "https://reqres.in/img/faces/2-image.jpg",
      ),
      UserModel(
        id: 3,
        email: "emma.wong@reqres.in",
        firstName: "Emma",
        lastName: "Wong",
        avatar: "https://reqres.in/img/faces/3-image.jpg",
      ),
      UserModel(
        id: 4,
        email: "eve.holt@reqres.in",
        firstName: "Eve",
        lastName: "Holt",
        avatar: "https://reqres.in/img/faces/4-image.jpg",
      ),
      UserModel(
        id: 5,
        email: "charles.morris@reqres.in",
        firstName: "Charles",
        lastName: "Morris",
        avatar: "https://reqres.in/img/faces/5-image.jpg",
      ),
      UserModel(
        id: 6,
        email: "tracey.ramos@reqres.in",
        firstName: "Tracey",
        lastName: "Ramos",
        avatar: "https://reqres.in/img/faces/6-image.jpg",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Future Builder",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: FutureBuilder<List<UserModel>>(
        future: getAllUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Loading...",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.red,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Error loading data",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Please check your internet connection",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Text("Retry"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasData) {
            List<UserModel> users = snapshot.data!;
            if (users.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.people_outline,
                      size: 64,
                      color: Colors.grey[400],
                    ),
                    SizedBox(height: 16),
                    Text(
                      "No users found",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "There are no users to display",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              );
            }
            
            return Padding(
              padding: EdgeInsets.all(16),
              child: ListView.separated(
                itemCount: users.length,
                separatorBuilder: (context, index) => SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final UserModel user = users[index];
                  return Card(
                    elevation: 4,
                    shadowColor: Colors.grey.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.blue[100],
                              backgroundImage: user.avatar.isNotEmpty 
                                  ? NetworkImage(user.avatar) 
                                  : null,
                              child: user.avatar.isEmpty 
                                  ? Text(
                                      user.initials,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.blue[700],
                                      ),
                                    )
                                  : null,
                              onBackgroundImageError: (exception, stackTrace) {
                                print("Error loading avatar for ${user.fullName}: $exception");
                              },
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.fullName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  user.email,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(height: 4),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[50],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    "ID: ${user.id}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue[700],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.grey[400],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning_amber_outlined,
                    size: 64,
                    color: Colors.orange,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "No data available",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Something went wrong while loading data",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}