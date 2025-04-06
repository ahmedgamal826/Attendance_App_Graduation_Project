import 'dart:io';

import 'package:flutter/material.dart';

class OpenCameraScreen extends StatelessWidget {
  final String scriptPath = "assets/open_camera.py"; // مسار ملف الكاميرا

  void runPythonScript(String mode) async {
    try {
      ProcessResult result = await Process.run(
        'python', // تأكد من أن لديك Python مثبتًا
        [scriptPath, mode],
        runInShell: true,
      );

      print("📌 Output: ${result.stdout}");
      print("⚠️ Error: ${result.stderr}");
    } catch (e) {
      print("❌ Error running Python script: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Attendance System")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => runPythonScript("check-in"),
              child: Text("Check In"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => runPythonScript("check-out"),
              child: Text("Check Out"),
            ),
          ],
        ),
      ),
    );
  }
}
