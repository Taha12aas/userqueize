import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:userqueize/Mobile/views/alert_view.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/auth_text_field.dart';
import 'package:userqueize/cubits/cubitTeacher/cubit_teacher.dart';
import 'package:userqueize/cubits/cubitTeacher/ques_app_status.dart';
import 'package:userqueize/utils/custom_app_bar.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';
import 'package:userqueize/utils/show_snack_bar.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});
  static String id = 'ChangePasswordView';

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  String oldPassword = '';
  String newPassword = '';

  String confirmPassword = '';
  GlobalKey<FormState> globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Scaffold(
        appBar: customAppBar('تغيير كلمة المرور', context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Text(
                          ': تغيير كلمة المرور',
                          style: FontStyleApp.whiteBold18.copyWith(
                            fontSize: getResponsiveText(context, 22),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'كلمة المرور القديمة',
                    style: FontStyleApp.whiteBold18.copyWith(
                      fontSize: getResponsiveText(context, 16),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthTextField(
                    validator: validateToPasswordOld,
                    hintText: 'كلمة المرور القديمة',
                    iconData: FontAwesomeIcons.lock,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    'كلمة المرور الجديدة',
                    style: FontStyleApp.whiteBold18.copyWith(
                      fontSize: getResponsiveText(context, 16),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthTextField(
                    validator: validateToPasswordNew,
                    hintText: 'كلمة المرور الجديدة',
                    iconData: FontAwesomeIcons.lock,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    'تأكيد كلمة المرور',
                    style: FontStyleApp.whiteBold18.copyWith(
                      fontSize: getResponsiveText(context, 16),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthTextField(
                    validator: validateToPasswordConfirm,
                    hintText: 'تأكيد كلمة المرور',
                    iconData: FontAwesomeIcons.lock,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  BlocBuilder<CubitTeacher, QuesAppStatus>(
                    builder: (context, state) {
                      if (state is SuccessState) {
                        return CustomButton(
                          title: 'حفظ',
                          onPressed: () {
                            if (globalKey.currentState!.validate()) {
                              if (oldPassword == CubitTeacher.user.password) {
                                BlocProvider.of<CubitTeacher>(context)
                                    .generateCode(CubitTeacher.user.phone);
                                Navigator.pushNamedAndRemoveUntil(context, AlertView.id,(route) => false,);
                                BlocProvider.of<CubitTeacher>(context)
                                    .updateUsers('password',
                                        CubitTeacher.user.name, newPassword);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  showSnackBar(
                                      context, 'كلمة المرور القديمة خاطئة'),
                                );
                              }
                            }
                          },
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? validateToPasswordConfirm(passwordd) {
    if (passwordd != newPassword) {
      return 'كلمة المرور غير متطابقة';
    }

    confirmPassword = passwordd;
    return null;
  }

  String? validateToPasswordNew(password2) {
    if (password2 == null || password2.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (password2.length < 8) {
      return 'كلمة المرور يجب أن تكون أطول من 8 محارف';
    }
    final hasUpperCase = password2.contains(RegExp(r'[A-Z]'));
    final hasLowerCase = password2.contains(RegExp(r'[a-z]'));
    final hasDigits = password2.contains(RegExp(r'[0-9]'));
    final hasSpecialCharacters = password2.contains(RegExp(r'[!@#\$&*~]'));

    if (!hasUpperCase) {
      return 'يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل';
    }
    if (!hasLowerCase) {
      return 'يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل';
    }
    if (!hasDigits) {
      return 'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل';
    }
    if (!hasSpecialCharacters) {
      return 'يجب أن تحتوي كلمة المرور على رمز خاص واحد على الأقل';
    }

    newPassword = password2;
    return null;
  }

  String? validateToPasswordOld(passwordd) {
    if (passwordd == null || passwordd.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (passwordd.length < 8) {
      return 'كلمة المرور يجب أن تكون أطول من 8 محارف';
    }
    final hasUpperCase = passwordd.contains(RegExp(r'[A-Z]'));
    final hasLowerCase = passwordd.contains(RegExp(r'[a-z]'));
    final hasDigits = passwordd.contains(RegExp(r'[0-9]'));
    final hasSpecialCharacters = passwordd.contains(RegExp(r'[!@#\$&*~]'));

    if (!hasUpperCase) {
      return 'يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل';
    }
    if (!hasLowerCase) {
      return 'يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل';
    }
    if (!hasDigits) {
      return 'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل';
    }
    if (!hasSpecialCharacters) {
      return 'يجب أن تحتوي كلمة المرور على رمز خاص واحد على الأقل';
    }

    oldPassword = passwordd;
    return null;
  }
}
