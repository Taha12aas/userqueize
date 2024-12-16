import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userqueize/Mobile/widgets/home_view/main_sections.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/list_view_card_subjects.dart';
import 'package:userqueize/cubit/ques_cubit.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/main_app_bar.dart';
import 'package:userqueize/utils/responsive_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static String id = 'HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    BlocProvider.of<QuesCubit>(context).fetchUsers(962449054);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar('الصفحة الرئيسية', context),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const MainSections(),
            const SizedBox(height: 20),
            Text(
              ' :  أحدث النشاطات',
              style: FontStyleApp.textStyleOrangeBold25.copyWith(
                fontSize: getResponsiveText(context, 25),
              ),
            ),
            const SizedBox(height: 10),
            const Expanded(child: ListViewCardSubjects())
          ],
        ),
      ),
    );
  }
}
