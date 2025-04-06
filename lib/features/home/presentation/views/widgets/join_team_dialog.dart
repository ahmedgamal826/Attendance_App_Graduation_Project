import 'package:flutter/material.dart';
import 'package:attendance_app/core/utils/app_colors.dart';

class JoinTeamDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Join a team using a code",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                TextField(
                  cursorColor: AppColors.primaryColor,
                  decoration: InputDecoration(
                    labelText: "Subject Code",
                    labelStyle: TextStyle(color: Colors.grey.shade700),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 14),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildDialogButton(context, "Cancel", Colors.red,
                        () => Navigator.pop(context)),
                    _buildDialogButton(context, "Join", Colors.green, () {
                      // تنفيذ العملية المطلوبة عند الضغط على Join
                      Navigator.pop(context);
                    }),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget _buildDialogButton(
      BuildContext context, String text, Color color, VoidCallback onPressed) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * 0.25,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
