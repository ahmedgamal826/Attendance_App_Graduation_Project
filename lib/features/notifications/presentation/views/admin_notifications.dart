import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/notifications/presentation/views/add_notifications_view.dart';
import 'package:attendance_app/features/notifications/presentation/views/update_notifications_view.dart';
import 'package:attendance_app/features/notifications/presentation/views/widgets/notifications_list.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class AdminNotifications extends StatefulWidget {
  @override
  _AdminNotificationsState createState() => _AdminNotificationsState();
}

class _AdminNotificationsState extends State<AdminNotifications> {
  void _showDeleteDialog(int index) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: 'Delete Notification',
      desc: 'Are you sure you want to delete this notification?',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        setState(() {
          notifications.removeAt(index);
        });
      },
    ).show();
  }

  void _showBottomSheet(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 150,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.edit, color: Colors.blue),
                title: const Text("Update"),
                onTap: () async {
                  Navigator.pop(context);
                  final updatedNotification = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateNotificationsView(
                        notification: notifications[index],
                        index: index,
                      ),
                    ),
                  );
                  if (updatedNotification != null) {
                    setState(() {
                      notifications[index] = {
                        "subject": updatedNotification["subject"],
                        "description": updatedNotification["description"],
                        "date": updatedNotification["date"],
                      };
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text("Delete"),
                onTap: () {
                  Navigator.pop(context);
                  _showDeleteDialog(index);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Notifications",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 7,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.notifications,
                      color: AppColors.primaryColor,
                      size: 30,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notifications[index]["subject"]!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            notifications[index]["description"]!,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          notifications[index]["date"]!,
                          style:
                              const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        IconButton(
                          icon: const Icon(Icons.more_vert,
                              color: Colors.black54),
                          onPressed: () => _showBottomSheet(context, index),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newNotification = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNotificationsView(),
            ),
          );
          if (newNotification != null) {
            setState(() {
              notifications.add(newNotification);
            });
          }
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
