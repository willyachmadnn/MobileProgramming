import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Sheet Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text("MyApps"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                builder: (context) => SizedBox(
                  height: 250,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () => debugPrint("Klik Foto"),
                        leading: const Icon(Icons.photo),
                        title: const Text("Foto"),
                      ),
                      ListTile(
                        onTap: () => debugPrint("Klik Music"),
                        leading: const Icon(Icons.music_note_rounded),
                        title: const Text("Music"),
                      ),
                      ListTile(
                        onTap: () => debugPrint("Klik Video"),
                        leading: const Icon(Icons.video_collection),
                        title: const Text("Video"),
                      ),
                      ListTile(
                        onTap: () => debugPrint("Klik Share"),
                        leading: const Icon(Icons.share),
                        title: const Text("Share"),
                      ),
                      ListTile(
                        onTap: () => Navigator.pop(context),
                        leading: const Icon(Icons.cancel),
                        title: const Text("Cancel"),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: const Text("Show Bottom Sheet"),
          ),
        ),
      ),
    );
  }
}