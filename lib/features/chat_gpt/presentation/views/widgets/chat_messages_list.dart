import 'package:attendance_app/core/provider/chat_provider.dart';
import 'package:attendance_app/features/chat_gpt/data/models/message.dart';
import 'package:attendance_app/features/chat_gpt/presentation/views/widgets/assistant_message_widget.dart';
import 'package:attendance_app/features/chat_gpt/presentation/views/widgets/my_message_widget.dart';
import 'package:flutter/material.dart';

class ChatMessagesList extends StatelessWidget {
  const ChatMessagesList({
    super.key,
    required this.scrollController,
    required this.chatProvider,
  });

  final ScrollController scrollController;
  final ChatProvider chatProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: chatProvider.messagesInChat.length,
      itemBuilder: (context, index) {
        final message = chatProvider.messagesInChat[index];

        return message.role.name == Role.user.name
            ? MyMessageWidget(message: message)
            : AssistantMessageWidget(
                message: message.message.toString(),
                timeSent: message.timeSent,
              );
      },
    );
  }
}
