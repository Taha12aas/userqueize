import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:userqueize/Mobile/views/change_password_view.dart';
import 'package:userqueize/Mobile/views/coursers_upload_view.dart';
import 'package:userqueize/Mobile/views/home_view.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/column_teacher_info.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/container_teache_subjects_display.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/teather_profile_view/teacher_photor.dart';
import 'package:userqueize/Service/teacher_service.dart';
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
  File? selectedImage;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      opacity: 0.5,
      progressIndicator: const CircularProgressIndicator(
        color: kOrange,
      ),
      child: Form(
        key: globalKey,
        child: Scaffold(
          appBar: customAppBar('ملف المدرس', context),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Center(
              child: SingleChildScrollView(
                child: BlocListener<CubitTeacher, QuesAppStatus>(
                  listener: (context, state) {
                    if (state is LoadingState) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomeView.id,
                        (route) => false,
                      );
                    } else {
                      log(state.toString());
                    }
                  },
                  child: BlocBuilder<CubitTeacher, QuesAppStatus>(
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return const CircularProgressIndicator(
                          color: kOrange,
                        );
                      } else if (state is SuccessState) {
                        List<dynamic> classes =
                            state.user!.classesSubjects['صف'];
                        List<dynamic> subjects =
                            state.user!.classesSubjects['مواد'];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 5),
                            TeacherPhoto(
                              selectedImage: selectedImage,
                              onPressed: () {
                                _pickImage();
                              },
                              image: state.user!.photo,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              state.user!.name,
                              style: FontStyleApp.whiteBold18.copyWith(
                                fontSize: getResponsiveText(context, 18),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: ColumnTeacherInfo(
                                    validator: validateToAddress,
                                    labelText: ': العنوان',
                                    initialValue: state.user!.address,
                                    iconData: FontAwesomeIcons.locationDot,
                                    horizntalSize: 64,
                                  ),
                                ),
                                Expanded(
                                  child: ColumnTeacherInfo(
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
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    title: 'تغير كلمة المرور',
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, ChangePasswordView.id);
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: CustomButton(
                                    title: 'رفع دورات',
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, CoursersUploadView.id);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            CustomButton(
                              title: 'الدورات المرفوعة مسبقا',
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, CoursersUploadView.id);
                              },
                            ),
                            const SizedBox(height: 25),
                            ContainerTeacherSubjectsDisplay(
                              classes: classes,
                              subjects: subjects,
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.1,
                            ),
                            CustomButton(
                              title: 'حفظ',
                              onPressed: () async {
                                if (globalKey.currentState!.validate()) {
                                  setState(() {
                                    _isLoading = true;
                                  });

                                  try {
                                    if (address != state.user!.address) {
                                      BlocProvider.of<CubitTeacher>(context)
                                          .updateUsers(
                                        'address',
                                        state.user!.name,
                                        address,
                                      );
                                    }
                                    if (phoneNumber != state.user!.phone) {
                                      BlocProvider.of<CubitTeacher>(context)
                                          .updateUsers(
                                        'phone',
                                        state.user!.name,
                                        phoneNumber,
                                      );
                                    }
                                    if (selectedImage != null) {
                                      final newImageUrl =
                                          await TeacherService.uploadImage(
                                        selectedImage!,
                                        state.user!.phone,
                                      );
                                      // ignore: use_build_context_synchronously
                                      BlocProvider.of<CubitTeacher>(context)
                                          .updateUsers(
                                        'photo',
                                        state.user!.name,
                                        newImageUrl,
                                      );
                                      setState(() {
                                        state.user!.photo = newImageUrl;
                                      });
                                    }
                                    if (mounted) {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                    if (phoneNumber == state.user!.phone &&
                                        address == state.user!.address) {
                                      if (mounted) {
                                        // ignore: use_build_context_synchronously
                                        Navigator.pop(context);
                                      }
                                    }
                                  } catch (e) {
                                    if (mounted) {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            Text("حدث خطأ أثناء التحديث: $e"),
                                      ),
                                    );
                                  }
                                }
                              },
                            )
                          ],
                        );
                      } else {
                        return const Text(
                          "حدث خطأ ما. يرجى المحاولة مرة أخرى.",
                          style: FontStyleApp.orangeBold30,
                        );
                      }
                    },
                  ),
                ),
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

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }
}
