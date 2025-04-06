import 'package:attendance_app/core/hive/boxes.dart';
import 'package:attendance_app/core/hive/chat_history.dart';
import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chat_gpt/presentation/manager/Providers/profile_provider.dart';
import 'package:attendance_app/features/chat_gpt/presentation/views/widgets/chat_history_card.dart';
import 'package:attendance_app/features/chat_gpt/presentation/views/widgets/empty_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class ChatHistoryView extends StatefulWidget {
  const ChatHistoryView({super.key});

  @override
  State<ChatHistoryView> createState() => _ChatHistoryViewState();
}

class _ChatHistoryViewState extends State<ChatHistoryView> {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      backgroundColor:
          profileProvider.isDarkMode ? const Color(0xff1E1E1E) : Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: profileProvider.isDarkMode
            ? const Color(0xff1E1E1E)
            : AppColors.primaryColor,
        centerTitle: true,
        title: const Text(
          'Chat History',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ValueListenableBuilder<Box<ChatHistory>>(
        valueListenable: Boxes.getChatHistory().listenable(),
        builder: (context, box, _) {
          // Get the chat history and sort it by timestamp (ascending order)
          final chatHistory = box.values.toList().cast<ChatHistory>()
            ..sort((a, b) =>
                b.timestamp.compareTo(a.timestamp)); // Sort by timestamp (date)

          return chatHistory.isEmpty
              ? const EmptyHistoryWidget()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: chatHistory.length,
                    itemBuilder: (context, index) {
                      final chat = chatHistory[index];
                      return ChatHistoryCard(chatHistory: chat);
                    },
                  ),
                );
        },
      ),
    );
  }
}
