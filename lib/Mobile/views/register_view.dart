import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:userqueize/Mobile/views/log_in_view.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/auth_text_field.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/logo_app.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/logo_image.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/register_or_log_in.dart';
import 'package:userqueize/cubits/cubitSubject/cubit_subject.dart';
import 'package:userqueize/cubits/cubitTeacher/cubit_teacher.dart';
import 'package:userqueize/cubits/cubitTeacher/ques_app_status.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';
import 'package:userqueize/utils/show_alert_dialog_and_navigate.dart';
import 'package:userqueize/utils/show_snack_bar.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  static String id = 'RegisterView';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isActiv = false;
  int phoneNumber = 0;
  String password = '';
  String confirmPassword = '';
  GlobalKey<FormState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Scaffold(
        body: ModalProgressHUD(
          progressIndicator: const CircularProgressIndicator(
            color: kOrangeColor,
          ),
          inAsyncCall: isActiv,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: MediaQuery.sizeOf(context).height),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      const LogoImage(),
                      const SizedBox(height: 10),
                      const LogoApp(),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Text(
                              'انشاء حساب',
                              textAlign: TextAlign.end,
                              style: FontStyleApp.whiteBold18.copyWith(
                                  fontSize: getResponsiveText(context, 18)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      AuthTextField(
                        validator: validateToPhoneNumber,
                        hintText: 'رقم الهاتف',
                        iconData: FontAwesomeIcons.phone,
                        keyboardType: true,
                      ),
                      const SizedBox(height: 18),
                      AuthTextField(
                        validator: validateToPassword,
                        hintText: 'كلمة المرور',
                        iconData: FontAwesomeIcons.lock,
                        obscureText: true,
                      ),
                      const SizedBox(height: 18),
                      AuthTextField(
                        validator: validateToPasswordConfirm,
                        hintText: 'تأكيد كلمة المرور',
                        iconData: FontAwesomeIcons.lock,
                        obscureText: true,
                      ),
                      const SizedBox(height: 10),
                      RegisterOrLogIn(
                        label1: 'لديك حساب ؟',
                        label2: 'اضغط هنا لتسجيل الدخول',
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            LogInView.id,
                            (route) => false,
                          );
                        },
                      ),
                      const Spacer(),
                      BlocListener<CubitTeacher, QuesAppStatus>(
                        listener: (context, state) {
                          if (state is SuccessState) {
                            if (CubitTeacher.user.password == '') {
                              BlocProvider.of<CubitTeacher>(context)
                                  .generateCode(CubitTeacher.user.phone);
                              showAlertDialogAndNavigate(context);
                              BlocProvider.of<CubitTeacher>(context)
                                  .updateUsers(
                                      'password', state.user!.name, password);
                              BlocProvider.of<CubitSubject>(context)
                                  .fetchSubject(state.user!.name);
                            } else {
                              isActiv = false;
                              setState(() {});
                              ScaffoldMessenger.of(context).showSnackBar(
                                  showSnackBar(
                                      context, 'هذا الحساب موجود مسبقا',Icons.error));
                            }
                          }
                        },
                        child: BlocBuilder<CubitTeacher, QuesAppStatus>(
                          builder: (context, state) {
                            return CustomButton(
                              iconData: Icons.login,
                              label: 'انشاء حساب',
                              onPressed: () {
                                if (globalKey.currentState!.validate()) {
                                  isActiv = true;
                                  setState(() {});
                                  BlocProvider.of<CubitTeacher>(context)
                                      .fetchUsers(phoneNumber);
                                }
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 65),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? validateToPassword(passwordd) {
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

    password = passwordd;
    return null;
  }

  String? validateToPasswordConfirm(passwordd) {
    if (passwordd != password) {
      return 'كلمة المرور غير متطابقة';
    }

    confirmPassword = passwordd;
    return null;
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
}
