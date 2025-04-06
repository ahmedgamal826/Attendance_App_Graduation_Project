import 'dart:io';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    required File? selectedImage,
  }) : _selectedImage = selectedImage;

  final File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 70,
      backgroundColor: Colors.grey[300],
      backgroundImage:
          _selectedImage != null ? FileImage(_selectedImage!) : null,
      child: _selectedImage == null
          ? const Icon(
              Icons.person,
              size: 50,
              color: Colors.black54,
            )
          : null,
    );
  }
}
