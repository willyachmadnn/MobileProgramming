import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
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
          padding: EdgeInsets.all(30),
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
                        onTap: () => print("Klik Foto"),
                        leading: Icon(Icons.photo),
                        title: Text("Foto"),
                      ),
                      ListTile(
                        onTap: () => print("Klik Music"),
                        leading: Icon(Icons.music_note_rounded),
                        title: Text("Music"),
                      ),
                      ListTile(
                        onTap: () => print("Klik Video"),
                        leading: Icon(Icons.video_collection),
                        title: Text("Video"),
                      ),
                      ListTile(
                        onTap: () => print("Klik Share"),
                        leading: Icon(Icons.share),
                        title: Text("Share"),
                      ),
                      ListTile(
                        onTap: () => Navigator.pop(context),
                        leading: Icon(Icons.cancel),
                        title: Text("Cancel"),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Text("Show Bottom Sheet"),
          ),
        ),
      ),
    );
  }
}
