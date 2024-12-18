import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userqueize/Mobile/views/teacher_profile_view.dart';
import 'package:userqueize/Mobile/widgets/home_view/DropDownSearch/show_custom_drop_down_search.dart';
import 'package:userqueize/cubits/ques_app_status.dart';
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
              } else {
                return const CircleAvatar(
                  radius: 18.0,
                  backgroundImage: AssetImage('assets/images/Teachers.png'),
                );
              }
            },
          ),
        ),
        Text(title, style: FontStyleApp.textStylewite15),
        IconButton(
          padding: const EdgeInsets.only(left: 25),
          tooltip: 'search',
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            showCustomDropDownSearch(context);
          },
        ),
      ],
    ),
  );
}
