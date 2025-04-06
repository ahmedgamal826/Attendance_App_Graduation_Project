import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationsDetailsView extends StatelessWidget {
  final Map<String, String> notification;

  const NotificationsDetailsView({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.whiteColor),
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "Notification Details",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          color: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Hero(
                    tag: "icon-${notification['subject']}",
                    child: const Icon(
                      Icons.notifications_active,
                      color: AppColors.primaryColor,
                      size: 50,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  notification["subject"]!,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Date: ${notification["date"]!}",
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),
                const Divider(thickness: 1.5, height: 25),
                const Text(
                  "Description:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  notification["description"]!,
                  style: const TextStyle(fontSize: 18, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
