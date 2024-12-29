import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userqueize/Mobile/widgets/home_view/list_view_item_card_subject.dart';
import 'package:userqueize/Mobile/widgets/home_view/main_sections.dart';
import 'package:userqueize/cubits/cubitTeacher/cubit_teacher.dart';
import 'package:userqueize/cubits/cubitTeacher/ques_app_status.dart';
import 'package:userqueize/utils/constants.dart';
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
    BlocProvider.of<CubitTeacher>(context).fetchUsers(CubitTeacher.user.phone);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitTeacher, QuesAppStatus>(builder: (context, state) {
      if (state is SuccessState) {
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
                  style: FontStyleApp.orangeBold25.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: getResponsiveText(context, 25),
                  ),
                ),
                const SizedBox(height: 10),
                const ListViewItemCardSubject()
              ],
            ),
          ),
        );
      } else {
        return const Scaffold(
            body: Center(
                child: CircularProgressIndicator(
          color: kOrangeColor,
        )));
      }
    });
  }
}
