import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:userqueize/Mobile/views/change_password_view.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/column_teacher_info.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/container_teache_subjects_display.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/teather_profile_view/teacher_name.dart';
import 'package:userqueize/Mobile/widgets/teather_profile_view/teacher_photor.dart';
import 'package:userqueize/cubits/cubitTeacher/ques_app_status.dart';
import 'package:userqueize/cubits/cubitTeacher/cubit_teacher.dart';
import 'package:userqueize/utils/custom_app_bar.dart';

class TeacherProfileView extends StatelessWidget {
  const TeacherProfileView({super.key});
  static String id = 'TeacherProfile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('ملف المدرس', context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Center(
          child: SingleChildScrollView(
            child: BlocBuilder<CubitTeacher, QuesAppStatus>(
              builder: (context, state) {
                if (state is SuccessState) {
                  List<dynamic> classes = state.user!.classesSubjects['صف'];
                  List<dynamic> subjects = state.user!.classesSubjects['مواد'];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      TeacherPhoto(
                        image: state.user!.photo,
                      ),
                      TeacherName(
                        name: state.user!.name,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ColumnTeacherInfo(
                              labelText: ': العنوان',
                              hintText: state.user!.address,
                              iconData: FontAwesomeIcons.locationDot,
                              horizntalSize: 64,
                            ),
                          ),
                          Expanded(
                            child: ColumnTeacherInfo(
                              labelText: ': رقم الهاتف',
                              hintText: '${state.user!.phone}',
                              iconData: FontAwesomeIcons.phone,
                              horizntalSize: 89,
                              keyboardType: true,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        title: 'تغير كلمة المرور',
                        onPressed: () {
                          Navigator.pushNamed(context, ChangePasswordView.id);
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ContainerTeacherSubjectsDisplay(
                        classes: classes,
                        subjects: subjects,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.1,
                      ),
                      CustomButton(
                        title: 'حفظ',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
