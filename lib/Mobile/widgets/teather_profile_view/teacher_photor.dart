import 'package:flutter/material.dart';
import 'dart:io';
class TeacherPhoto extends StatefulWidget {
  const TeacherPhoto({
    super.key,
    required this.image,
    this.selectedImage, required this.onPressed,
  });

  final String image;
  final File? selectedImage;
  final VoidCallback onPressed;
  @override
  State<TeacherPhoto> createState() => _TeacherPhotoState();
}

class _TeacherPhotoState extends State<TeacherPhoto> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.sizeOf(context).height * .07,
      backgroundImage: _selectedImage != null
          ? FileImage(_selectedImage!) as ImageProvider
          : NetworkImage(widget.image),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: IconButton(
          onPressed: widget.onPressed,
          icon: const Icon(Icons.add_a_photo),
          color: Colors.orange,
        ),
      ),
    );
  }

   
}
