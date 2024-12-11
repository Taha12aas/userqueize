import 'package:flutter/material.dart';
import 'package:userqueize/utils/constants.dart';

class TeacherPhoto extends StatelessWidget {
  const TeacherPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.sizeOf(context).height * .07,
      backgroundImage: const AssetImage('assets/images/TeachersTaha.jpg'),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_a_photo),
            color: kOrangeColor),
      ),
    );
  }
}
