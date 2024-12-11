import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/home_view/main_sections.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/list_view_card_subjects.dart';
import 'package:userqueize/utils/main_view_app_bar.dart';
import 'package:userqueize/utils/font_style.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainViewAppBar(context),
      body: const Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MainSections(),
            SizedBox(height: 20),
            Text(' :  أحدث النشاطات',
                style: FontStyleApp.textStyleOrangeBold25),
            SizedBox(height: 10),
            Expanded(child: ListViewCardSubjects())
          ],
        ),
      ),
    );
  }
}
