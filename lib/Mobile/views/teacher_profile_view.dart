import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:userqueize/Mobile/views/change_password_view.dart';
import 'package:userqueize/Mobile/views/home_view.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/column_teacher_info.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/container_teache_subjects_display.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/teather_profile_view/teacher_photor.dart';
import 'package:userqueize/cubits/cubitTeacher/ques_app_status.dart';
import 'package:userqueize/cubits/cubitTeacher/cubit_teacher.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/custom_app_bar.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class TeacherProfileView extends StatefulWidget {
  const TeacherProfileView({super.key});
  static String id = 'TeacherProfile';

  @override
  State<TeacherProfileView> createState() => _TeacherProfileViewState();
}

class _TeacherProfileViewState extends State<TeacherProfileView> {
  String address = '';
  int phoneNumber = 0;
  GlobalKey<FormState> globalKey = GlobalKey();
  late TextEditingController addressController;

  late TextEditingController phoneNumberController;
  @override
  void initState() {
    super.initState();
    addressController = TextEditingController();
    phoneNumberController = TextEditingController();
    // تعيين القيم الأولية
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = BlocProvider.of<CubitTeacher>(context).state;
      if (state is SuccessState) {
        addressController.text = state.user!.address;
        phoneNumberController.text = state.user!.phone.toString();
      }
    });
  }

  @override
  void dispose() {
    addressController.dispose(); // إغلاق متحكم العنوان
    phoneNumberController.dispose(); // إغلاق متحكم رقم الهاتف
    super.dispose(); // استدعاء dispose من الكلاس الأب
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Scaffold(
        appBar: customAppBar('ملف المدرس', context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Center(
            child: SingleChildScrollView(
              child: BlocBuilder<CubitTeacher, QuesAppStatus>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const CircularProgressIndicator(
                      color: kOrangeColor,
                    );
                  } else if (state is SuccessState) {
                    List<dynamic> classes = state.user!.classesSubjects['صف'];
                    List<dynamic> subjects =
                        state.user!.classesSubjects['مواد'];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        TeacherPhoto(
                          image: state.user!.photo,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          state.user!.name,
                          style: FontStyleApp.textStyleWhiteBold18.copyWith(
                            fontSize: getResponsiveText(context, 18),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ColumnTeacherInfo(
                                controller: addressController,
                                validator: validateToAddress,
                                labelText: ': العنوان',
                                initialValue: state.user!.address,
                                iconData: FontAwesomeIcons.locationDot,
                                horizntalSize: 64,
                              ),
                            ),
                            Expanded(
                              child: ColumnTeacherInfo(
                                controller: phoneNumberController,
                                validator: validateToPhoneNumber,
                                labelText: ': رقم الهاتف',
                                initialValue: '${state.user!.phone}',
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
                              if (globalKey.currentState!.validate()) {
                                final updatedAddress =
                                    addressController.text.trim();
                                final updatedPhone = int.parse(
                                    phoneNumberController.text.trim());

                                if (updatedAddress != state.user!.address) {
                                  BlocProvider.of<CubitTeacher>(context)
                                      .updateUsers(
                                    'address',
                                    state.user!.name,
                                    updatedAddress,
                                  );
                                }

                                if (updatedPhone != state.user!.phone) {
                                  BlocProvider.of<CubitTeacher>(context)
                                      .updateUsers(
                                    'phone',
                                    state.user!.name,
                                    updatedPhone,
                                  );
                                }

                                // الانتقال إلى الصفحة الرئيسية بعد الحفظ
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  HomeView.id,
                                  (route) => false,
                                );
                              }
                            })
                      ],
                    );
                  } else {
                    return const Text(
                      "حدث خطأ ما. يرجى المحاولة مرة أخرى.",
                      style: FontStyleApp.textStyleOrangeBold30,
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? validateToPhoneNumber(p0) {
    if (p0.isEmpty) {
      return 'رقم الهاتف مطلوب';
    } else if (p0!.length < 12 || p0.length > 12) {
      return 'الرجاء ادخال 12 رقم فقط';
    }
    phoneNumber = int.parse(p0);
    return null;
  }

  String? validateToAddress(p0) {
    if (p0.isEmpty) {
      return 'العنوان مطلوب';
    }
    address = p0;
    return null;
  }
}
