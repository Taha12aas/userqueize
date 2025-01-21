import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:userqueize/cubits/cubitTeacher/ques_app_status.dart';
import 'dart:io';

import 'package:userqueize/cubits/cubitTeacher/cubit_teacher.dart';

class TeacherPhoto extends StatefulWidget {
  const TeacherPhoto({
    super.key,
    required this.image,
  });

  final String image;

  @override
  State<TeacherPhoto> createState() => _TeacherPhotoState();
}

class _TeacherPhotoState extends State<TeacherPhoto> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource
          .gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.sizeOf(context).height * .07,
      backgroundImage: _selectedImage != null
          ? FileImage(_selectedImage!) as ImageProvider
          : NetworkImage(widget.image),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: BlocBuilder<CubitTeacher, QuesAppStatus>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                if (state is SuccessState) {
                  _pickImage();
                }
              },
              icon: const Icon(Icons.add_a_photo),
              color: Colors.orange,
            );
          },
        ),
      ),
    );
  }
}
