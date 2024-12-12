import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/views/teacher_profile_view.dart';
import 'package:userqueize/Mobile/widgets/home_view/DropDownSearch/show_custom_drop_down_search.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';

AppBar mainAppBar(String title, BuildContext context) {
  return AppBar(
    centerTitle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
    ),
    backgroundColor: kAshenColor,
    title: Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, TeacherProfileView.id);
          },
          child: const CircleAvatar(
            radius: 18.0,
            backgroundImage: AssetImage('assets/images/TeachersTaha.jpg'),
          ),
        ),
        SizedBox(width: MediaQuery.sizeOf(context).width*.26,),
        Text(
          title,
          style: FontStyleApp.textStylewite15
              .copyWith(fontWeight: FontWeight.w800),
        ),
      ],
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    actions: [
      IconButton(
        tooltip: 'search',
        icon: const Icon(Icons.search, color: Colors.white),
        onPressed: () {
          showCustomDropDownSearch(context);
        },
      ),
    ],
  );
}
