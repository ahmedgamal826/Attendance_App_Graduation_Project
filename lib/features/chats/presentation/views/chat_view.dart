import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chats/data/models/chat_model.dart';
import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
import 'package:attendance_app/features/chats/presentation/views/update_chat_view.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/show_image.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class ChatView extends StatefulWidget {
  final ChatModel chat;

  const ChatView({super.key, required this.chat});

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  bool _isUploadingImage = false;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<ChatViewModel>(context, listen: false)
          .initChatMessages(widget.chat);
    });
  }

  void _showDeleteDialog(ChatViewModel viewModel) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.scale,
      title: 'Delete Chat',
      desc: 'Are you sure you want to delete this chat?',
      btnCancelOnPress: () {},
      btnOkOnPress: () async {
        try {
          await viewModel.deleteChat(widget.chat.id);
          Navigator.pop(context);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to delete chat: $e')),
          );
        }
      },
      btnOkText: 'Delete',
      btnCancelText: 'Cancel',
    ).show();
  }

  void _setUploadingImage(bool value) {
    if (mounted) {
      setState(() {
        _isUploadingImage = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatViewModel>(
      builder: (context, viewModel, child) {
        final appBar = AppBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          // title: Row(
          //   children: [
          //     GestureDetector(
          //       onTap: () {
          //         if (widget.chat.avatar.isNotEmpty &&
          //             widget.chat.avatar.startsWith('http')) {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => ShowImage(
          //                 imageUrl: widget.chat.avatar,
          //               ),
          //             ),
          //           );
          //         }
          //       },
          //       child: CircleAvatar(
          //         radius: 20,
          //         backgroundColor: AppColors.primaryColor,
          //         child: widget.chat.avatar.isNotEmpty &&
          //                 widget.chat.avatar.startsWith('http')
          //             ? ClipOval(
          //                 child: Image.network(
          //                   widget.chat.avatar,
          //                   width: 40,
          //                   height: 40,
          //                   fit: BoxFit.cover,
          //                   errorBuilder: (context, error, stackTrace) {
          //                     print('Error loading avatar in ChatView: $error');
          //                     return const Icon(
          //                       Icons.person,
          //                       color: Colors.white,
          //                       size: 24,
          //                     );
          //                   },
          //                 ),
          //               )
          //             : const Icon(
          //                 Icons.person,
          //                 color: Colors.white,
          //                 size: 24,
          //               ),
          //       ),
          //     ),
          //     const SizedBox(width: 10),
          //     Expanded(
          //       child: Text(
          //         widget.chat.name, // الاسم بتاع الطرف الآخر
          //         style: const TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.white,
          //         ),
          //         overflow: TextOverflow.ellipsis,
          //         maxLines: 1,
          //       ),
          //     ),
          //   ],
          // ),

          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (widget.chat.avatar.isNotEmpty &&
                      widget.chat.avatar.startsWith('http')) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowImage(
                          imageUrl: widget.chat.avatar,
                        ),
                      ),
                    );
                  }
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: widget.chat.avatar.isNotEmpty &&
                          widget.chat.avatar.startsWith('http')
                      ? ClipOval(
                          child: Image.network(
                            widget.chat.avatar,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              print('Error loading avatar in ChatView: $error');
                              return const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 24,
                              );
                            },
                          ),
                        )
                      : const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 24,
                        ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  widget.chat.name, // الاسم بتاع الطرف الآخر
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          actions: [
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onSelected: (value) {
                if (value == 'delete') {
                  _showDeleteDialog(viewModel);
                } else if (value == 'update') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateChatView(chat: widget.chat),
                    ),
                  );
                }
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<String>(
                  value: 'update',
                  child: Text('Update Chat Name'),
                ),
                const PopupMenuItem<String>(
                  value: 'delete',
                  child: Text('Delete Chat'),
                ),
              ],
              offset: const Offset(0, 50),
            ),
          ],
        );

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar,
          body: Stack(
            children: [
              Column(
                children: [
                  // Expanded(
                  //   child: ListView.builder(
                  //     controller: viewModel.scrollController,
                  //     physics: const AlwaysScrollableScrollPhysics(),
                  //     padding: const EdgeInsets.symmetric(
                  //         vertical: 10, horizontal: 10),
                  //     cacheExtent: 1000.0,
                  //     itemCount: viewModel.localMessages.length + 1,
                  //     itemBuilder: (context, index) {
                  //       if (index == 0) {
                  //         if (viewModel.localMessages.isNotEmpty) {
                  //           final latestTime = DateTime.now();
                  //           return Center(
                  //             child: Padding(
                  //               padding:
                  //                   const EdgeInsets.symmetric(vertical: 10),
                  //               child: Container(
                  //                 padding: const EdgeInsets.symmetric(
                  //                     horizontal: 12, vertical: 6),
                  //                 decoration: BoxDecoration(
                  //                   color: Colors.green.withOpacity(0.2),
                  //                   borderRadius: BorderRadius.circular(16),
                  //                 ),
                  //                 child: Text(
                  //                   '${latestTime.day}/${latestTime.month}/${latestTime.year}',
                  //                   style: const TextStyle(
                  //                     fontSize: 14,
                  //                     color: Colors.black54,
                  //                     fontWeight: FontWeight.w500,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           );
                  //         }
                  //         return const SizedBox.shrink();
                  //       }
                  //       final messageIndex = index - 1;
                  //       final message = viewModel.localMessages[messageIndex];
                  //       final isMe = message['isMe'] as bool;
                  //       return ChatsBubble(
                  //         isMe: isMe,
                  //         message: message,
                  //         chatId: widget.chat.id,
                  //       );
                  //     },
                  //   ),
                  // ),

                  Expanded(
                    child: ListView.builder(
                      controller: viewModel.scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      cacheExtent: 1000.0,
                      itemCount: viewModel.localMessages.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          if (viewModel.localMessages.isNotEmpty) {
                            final latestTime = DateTime.now();
                            return Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(
                                    '${latestTime.day}/${latestTime.month}/${latestTime.year}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        }
                        final messageIndex = index - 1;
                        final message = viewModel.localMessages[messageIndex];
                        final isMe = message['isMe'] as bool;
                        return ChatsBubble(
                          isMe: isMe,
                          message: message,
                          chatId: widget.chat.id,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Container(
                        //   width: 40,
                        //   height: 40,
                        //   decoration: const BoxDecoration(
                        //     color: AppColors.primaryColor,
                        //     shape: BoxShape.circle,
                        //   ),
                        //   child: IconButton(
                        //     icon: const Icon(
                        //       Icons.mic,
                        //       color: Colors.white,
                        //       size: 24,
                        //     ),
                        //     onPressed: () {},
                        //   ),
                        // ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: ChatTextField(
                            messageController: viewModel.messageController,
                            chatId: widget.chat.id,
                            onUploadingImage: _setUploadingImage,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.send,
                            color: AppColors.primaryColor,
                          ),
                          onPressed: () => viewModel.sendMessage(
                            widget.chat.id,
                            viewModel.messageController.text,
                            true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (_isUploadingImage)
                const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
