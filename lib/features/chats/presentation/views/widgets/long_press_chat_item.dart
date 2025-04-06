import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chats/data/models/chat_model.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/chat_item.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class LongPressChatItem extends StatefulWidget {
  final ChatModel chat;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const LongPressChatItem({
    super.key,
    required this.chat,
    required this.onTap,
    required this.onDelete,
  });

  @override
  _LongPressChatItemState createState() => _LongPressChatItemState();
}

class _LongPressChatItemState extends State<LongPressChatItem> {
  bool _isHighlighted = false; // متغير لتتبع حالة التظليل

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onLongPress: () {
        setState(() {
          _isHighlighted = true; // تفعيل التظليل عند الضغط المطول
        });

        // عرض AwesomeDialog
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.bottomSlide,
          title: 'Delete Chat',
          desc: 'Are you sure you want to delete this chat?',
          btnCancelOnPress: () {
            setState(() {
              _isHighlighted = false; // إلغاء التظليل عند الإلغاء
            });
          },
          btnOkOnPress: () {
            widget.onDelete(); // تنفيذ الحذف
            setState(() {
              _isHighlighted = false; // إلغاء التظليل بعد الحذف
            });
          },
          btnOkText: 'Delete',
          btnCancelText: 'Cancel',
          btnOkColor: AppColors.primaryColor,
          btnCancelColor: Colors.grey,
        ).show();
      },
      child: Container(
        color: _isHighlighted
            ? AppColors.primaryColor
            : Colors.transparent, // اللون الطبيعي
        child: ChatItem(
          chat: widget.chat,
          onTap: widget.onTap,
        ),
      ),
    );
  }
}
