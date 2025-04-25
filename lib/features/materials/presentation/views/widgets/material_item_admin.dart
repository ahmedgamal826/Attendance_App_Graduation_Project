import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../../../models/material_model_admin.dart';

class MaterialItemAdmin extends StatefulWidget {
  final MaterialFile file;
  final int index;
  final VoidCallback onDelete;
  final VoidCallback onShare;
  final VoidCallback onTap; // إضافة onTap
  final BuildContext parentContext;

  const MaterialItemAdmin({
    Key? key,
    required this.file,
    required this.index,
    required this.onDelete,
    required this.onShare,
    required this.onTap,
    required this.parentContext,
  }) : super(key: key);

  @override
  _MaterialItemAdminState createState() => _MaterialItemAdminState();
}

class _MaterialItemAdminState extends State<MaterialItemAdmin> {
  bool _isTapped = false;

  void _showOptionsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Options',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0D47A1),
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(
                  Icons.share,
                  color: Color(0xFF1976D2),
                ),
                title: const Text(
                  'Share',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF0D47A1),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  widget.onShare();
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
                title: const Text(
                  'Delete',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _showDeleteConfirmationDialog();
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1976D2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDeleteConfirmationDialog() {
    AwesomeDialog(
      context: widget.parentContext,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: 'Confirm Delete',
      desc: 'Are you sure you want to delete "${widget.file.name}"?',
      dismissOnTouchOutside: false,
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        widget.onDelete();
        ScaffoldMessenger.of(widget.parentContext).showSnackBar(
          SnackBar(
            content: Text('${widget.file.name} deleted'),
            backgroundColor: const Color(0xFF1565C0),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
      btnOkText: 'Delete',
      btnCancelText: 'Cancel',
      btnOkColor: Colors.red,
      btnCancelColor: Colors.grey,
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isTapped = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      onTap: widget.onTap, // استخدام onTap الجديد
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              const Color(0xFFE3F2FD).withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF90CAF9),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isTapped ? 0.15 : 0.1),
              blurRadius: _isTapped ? 8 : 6,
              offset: Offset(0, _isTapped ? 4 : 2),
              spreadRadius: _isTapped ? 2 : 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF1976D2).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.description_rounded,
                  size: 32,
                  color: Color(0xFF1976D2),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        widget.file.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0D47A1),
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.file.size,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  _showOptionsBottomSheet(context);
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF1976D2).withOpacity(0.1),
                  ),
                  child: const Icon(
                    Icons.more_vert,
                    color: Color(0xFF1976D2),
                    size: 23,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
