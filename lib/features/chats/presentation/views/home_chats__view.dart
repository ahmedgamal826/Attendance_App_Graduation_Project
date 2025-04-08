import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
import 'package:attendance_app/features/chats/presentation/views/chat_view.dart';
import 'package:attendance_app/features/chats/presentation/views/new_chat_view.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/long_press_chat_item.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/search_chats_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeChatsView extends StatelessWidget {
  const HomeChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatViewModel(ChatRepository()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Chats',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Consumer<ChatViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: SearchChatsTextField(
                    hintText: 'Search or start a new chat',
                    onChanged: (query) {
                      viewModel.filterChats(query);
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.chats.length,
                    itemBuilder: (context, index) {
                      return LongPressChatItem(
                        chat: viewModel.chats[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatView(
                                chat: viewModel.chats[index],
                              ),
                            ),
                          );
                        },
                        onDelete: () {
                          viewModel.deleteChat(index); // حذف الشات
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "_home_chats_screen",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewChatView(),
              ),
            );
          },
          backgroundColor: AppColors.primaryColor,
          child: const Icon(
            Icons.add_comment_rounded,
            color: Colors.white,
            size: 23,
          ),
        ),
      ),
    );
  }
}
