import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/controllers/task_controller.dart';

class AddTaskView extends GetView<TaskController> {
  const AddTaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleC = TextEditingController();
    final TextEditingController descriptionC = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Tugas Baru'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: titleC,
              decoration: const InputDecoration(
                labelText: "Judul Tugas",
                hintText: "Contoh: Belajar Flutter",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: descriptionC,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Deskripsi",
                hintText: "Detail tugas...",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (titleC.text.isNotEmpty) {
                    controller.addTask(
                      titleC.text,
                      description: descriptionC.text,
                    );
                    Get.back();
                    Get.snackbar("Sukses", "Tugas berhasil ditambahkan",
                        snackPosition: SnackPosition.BOTTOM);
                  } else {
                    Get.snackbar("Error", "Judul tugas wajib diisi!",
                        backgroundColor: Colors.red.withOpacity(0.3),
                        colorText: Colors.red);
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("SIMPAN TUGAS"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}