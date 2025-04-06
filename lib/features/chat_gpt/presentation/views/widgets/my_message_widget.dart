import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chat_gpt/data/models/message.dart';
import 'package:attendance_app/features/chat_gpt/presentation/views/widgets/images_preview_widget.dart';
import 'package:attendance_app/features/chat_gpt/presentation/views/widgets/row_bottom_message.dart';
import 'package:attendance_app/features/chat_gpt/presentation/manager/Providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyMessageWidget extends StatelessWidget {
  const MyMessageWidget({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 10, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: width * 0.8,
                ),
                decoration: BoxDecoration(
                  color: profileProvider.isDarkMode
                      ? const Color.fromARGB(255, 249, 248, 248)
                      : AppColors.primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (message.imagesUrls.isNotEmpty)
                      ImagesPreviewWidget(
                        message: message,
                      ),
                    const SizedBox(height: 8),
                    SelectableText(
                      message.message.toString(),
                      style: TextStyle(
                        color: profileProvider.isDarkMode
                            ? Colors.black
                            : Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 5),
                    RowBottomMessage(
                      role: Role.user,
                      timeSent: message.timeSent.toString(),
                      message: message.message.toString(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            Image.asset(
              'assets/user.png',
              width: MediaQuery.of(context).size.width * 0.07,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
