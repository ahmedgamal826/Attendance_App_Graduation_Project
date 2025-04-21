import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/show_image.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/show_pdf.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatsBubble extends StatefulWidget {
  const ChatsBubble({
    super.key,
    required this.isMe,
    required this.message,
    required this.chatId,
  });

  final bool isMe;
  final Map<String, dynamic> message;
  final String chatId;

  @override
  _ChatsBubbleState createState() => _ChatsBubbleState();
}

class _ChatsBubbleState extends State<ChatsBubble> {
  bool _isHighlighted = false;
  bool _isTapped = false;
  // تحديد ما إذا كان النص عربيًا
  bool _isArabic(String text) {
    if (text.isEmpty) return false;
    return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
  }

  // تنسيق الوقت بشكل مشابه للواتساب (مثل: 10:30 AM)
  String _formatTime(String timeString) {
    try {
      final dateTime = DateTime.parse(timeString);
      final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
      final minute = dateTime.minute.toString().padLeft(2, '0');
      final period = dateTime.hour >= 12 ? 'PM' : 'AM';
      return '$hour:$minute $period';
    } catch (e) {
      return timeString;
    }
  }

  // فتح المستند في تطبيق خارجي
  Future<void> _openDocument(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error opening document: $e')),
        );
      }
    }
  }

  // فحص إذا كان الملف صورة
  bool _isImageFile(String? fileName) {
    if (fileName == null) return false;
    final lowerCase = fileName.toLowerCase();
    return lowerCase.endsWith('.jpg') ||
        lowerCase.endsWith('.jpeg') ||
        lowerCase.endsWith('.png') ||
        lowerCase.endsWith('.gif');
  }

  // فحص إذا كان الملف PDF
  bool _isPDFFile(String? fileName) {
    if (fileName == null) return false;
    return fileName.toLowerCase().endsWith('.pdf');
  }

  // عرض حوار الحذف
  void _showDeleteDialog() {
    if (mounted) {
      setState(() {
        _isHighlighted = true;
      });
    }

    final viewModel = Provider.of<ChatViewModel>(context, listen: false);
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.scale,
      title: 'Delete Message',
      desc: 'Are you sure you want to delete this message?',
      btnCancelOnPress: () {
        if (mounted) {
          setState(() {
            _isHighlighted = false;
          });
        }
      },
      btnOkOnPress: () async {
        try {
          await viewModel.deleteMessage(
              widget.chatId, widget.message['messageId']);
          if (mounted) {
            setState(() {
              _isHighlighted = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Message deleted')),
            );
          }
        } catch (e) {
          if (mounted) {
            setState(() {
              _isHighlighted = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to delete message: $e')),
            );
          }
        }
      },
      btnOkText: 'Delete',
      btnCancelText: 'Cancel',
    ).show();
  }

  // عرض حوار التنبيه
  void _showNotAllowedDialog() {
    if (mounted) {
      setState(() {
        _isHighlighted = true;
      });
    }

    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.scale,
      title: 'Not Allowed',
      desc: 'You are not allowed to delete this message.',
      btnOkOnPress: () {
        if (mounted) {
          setState(() {
            _isHighlighted = false;
          });
        }
      },
      btnOkText: 'OK',
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    final isImage = widget.message['isImage'] == true;
    final isDocument = widget.message['isDocument'] == true;
    final fileName = widget.message['fileName'] as String?;
    final isArabicText = _isArabic(widget.message['text'] ?? '');
    final textDirection = isArabicText ? TextDirection.rtl : TextDirection.ltr;
    final textAlign = isArabicText ? TextAlign.right : TextAlign.left;

    // تحديد نوع الملف بناءً على الامتداد
    final isImageFile = _isImageFile(fileName);
    final isPDFFile = _isPDFFile(fileName);

    return GestureDetector(
      onLongPress: widget.isMe ? _showDeleteDialog : _showNotAllowedDialog,
      onTap: isImage || isImageFile
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowImage(
                    imageUrl: widget.message['text'],
                  ),
                ),
              );
            }
          : isDocument && isPDFFile
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShowPDF(
                        pdfUrl: widget.message['text'],
                        fileName: fileName,
                      ),
                    ),
                  );
                }
              : isDocument
                  ? () => _openDocument(widget.message['text'])
                  : null,
      child: Align(
        alignment: widget.isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: IntrinsicWidth(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 250),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: isImage || isDocument
                ? const EdgeInsets.all(5)
                : const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: _isHighlighted
                  ? Colors.blue.withOpacity(0.5)
                  : widget.isMe
                      ? const Color(0xFFDCF8C6)
                      : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12),
                topRight: const Radius.circular(12),
                bottomLeft: widget.isMe
                    ? const Radius.circular(12)
                    : const Radius.circular(0),
                bottomRight: widget.isMe
                    ? const Radius.circular(0)
                    : const Radius.circular(12),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (isImage || isImageFile)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: widget.message['text'],
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 50,
                      ),
                    ),
                  )
                else if (isDocument)
                  InkWell(
                    onTapDown: (_) {
                      setState(() {
                        _isTapped = true; // تغيير الحالة لما المستخدم يضغط
                      });
                    },
                    onTapCancel: () {
                      setState(() {
                        _isTapped = false; // إرجاع الحالة لما يلغي الضغط
                      });
                    },
                    onTap: () {
                      setState(() {
                        _isTapped = false; // إرجاع الحالة بعد الضغط
                      });
                      if (isImageFile) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowImage(
                              imageUrl: widget.message['text'],
                            ),
                          ),
                        );
                      } else if (isPDFFile) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowPDF(
                              pdfUrl: widget.message['text'],
                              fileName: fileName,
                            ),
                          ),
                        );
                      } else {
                        _openDocument(widget.message['text']);
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      transform: Matrix4.identity()
                        ..scale(_isTapped ? 0.98 : 1.0), // تأثير تكبير/تصغير
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                        color: _isTapped
                            ? Colors.grey.withOpacity(0.1)
                            : Colors.grey
                                .withOpacity(0.05), // تغيير اللون لما يضغط
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.primaryColor.withOpacity(0.2),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // معاينة صغيرة للصور أو أيقونة للملف
                          isImageFile
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    imageUrl: widget.message['text'],
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.image,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                                  ),
                                )
                              : Icon(
                                  isPDFFile
                                      ? Icons.picture_as_pdf
                                      : Icons.description,
                                  color: isPDFFile ? Colors.red : Colors.grey,
                                  size: 40,
                                ),
                          const SizedBox(width: 12),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  fileName ?? 'Document',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                    //  decoration: TextDecoration.underline,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  isImageFile
                                      ? 'Image'
                                      : isPDFFile
                                          ? 'PDF'
                                          : 'Document',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  Directionality(
                    textDirection: textDirection,
                    child: Container(
                      alignment: isArabicText
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: SelectableText(
                        widget.message['text'],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        textDirection: textDirection,
                        textAlign: textAlign,
                      ),
                    ),
                  ),
                const SizedBox(height: 6),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  textDirection: TextDirection.ltr,
                  children: [
                    Text(
                      _formatTime(widget.message['time']),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    if (widget.isMe) const SizedBox(width: 5),
                    if (widget.isMe)
                      Icon(
                        widget.message['isRead'] == true
                            ? Icons.done_all
                            : Icons.done,
                        size: 16,
                        color: widget.message['isRead'] == true
                            ? Colors.blue
                            : Colors.grey,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
