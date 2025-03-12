import 'package:flutter/material.dart';
import 'dart:io';

class TeacherPhoto extends StatefulWidget {
  const TeacherPhoto({
    super.key,
    required this.image,
    this.selectedImage,
    required this.onPressed,
  });

  final String image;
  final File? selectedImage;
  final VoidCallback onPressed;

  @override
  State<TeacherPhoto> createState() => _TeacherPhotoState();
}

class _TeacherPhotoState extends State<TeacherPhoto> {
  @override
  Widget build(BuildContext context) {
    final ImageProvider imageProvider = widget.selectedImage != null
        ? FileImage(widget.selectedImage!)
        : NetworkImage(widget.image) as ImageProvider;

    return CircleAvatar(
      radius: MediaQuery.sizeOf(context).height * .07,
      backgroundImage: imageProvider,
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
