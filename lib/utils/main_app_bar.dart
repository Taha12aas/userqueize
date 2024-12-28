import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userqueize/Mobile/views/teacher_profile_view.dart';
import 'package:userqueize/cubits/cubitTeacher/ques_app_status.dart';
import 'package:userqueize/cubits/cubitTeacher/cubit_teacher.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';

AppBar mainAppBar(String title, BuildContext context) {
  return AppBar(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
    ),
    backgroundColor: kAshenColor,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Navigator.pushNamed(context, TeacherProfileView.id);
          },
          child: BlocBuilder<CubitTeacher, QuesAppStatus>(
            builder: (context, state) {
              if (state is SuccessState) {
                return CircleAvatar(
                  radius: 18.0,
                  backgroundImage: NetworkImage(state.user!.photo),
                );
              } else if (state is LoadingState) {
                return const CircularProgressIndicator(
                  color: kOrangeColor,
                );
              } else {
                return const CircleAvatar(
                  radius: 18.0,
                  backgroundImage: AssetImage('assets/images/Teachers.png'),
                );
              }
            },
          ),
        ),
        Flexible(
          child: Center(
            child: Text(
              title,
              style: FontStyleApp.boldWhite15
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        )
      ],
    ),
  );
}
