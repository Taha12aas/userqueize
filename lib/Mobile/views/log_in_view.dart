import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:userqueize/Mobile/views/home_view.dart';
import 'package:userqueize/Mobile/views/register_view.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/auth_text_field.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/logo_app.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/logo_image.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/register_or_log_in.dart';
import 'package:userqueize/cubits/cubitSubject/cubit_subject.dart';
import 'package:userqueize/cubits/cubitTeacher/ques_app_status.dart';
import 'package:userqueize/cubits/cubitTeacher/cubit_teacher.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/show_snack_bar.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});
  static String id = 'LogInView';

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  int phoneNumber = 0;
  String password = '';
  GlobalKey<FormState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Scaffold(
        body: SingleChildScrollView(
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
                    const SizedBox(height: 40),
                    const LogoApp(),
                    const SizedBox(height: 40),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Text(
                            'تسجيل الدخول',
                            textAlign: TextAlign.end,
                            style: ArabicTextStyle(
                                arabicFont: ArabicFont.aalooBhaijaan,
                                fontSize: 20,
                                color: kOrangeColor),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    AuthTextField(
                      initialValue: '963988818024',
                      validator: validateToPhoneNumber,
                      hintText: '963988888888',
                      iconData: FontAwesomeIcons.phone,
                      keyboardType: true,
                    ),
                    const SizedBox(height: 18),
                    AuthTextField(
                      initialValue: 'Taha!@#taha123',
                      validator: validateToPassword,
                      hintText: 'كلمة المرور',
                      iconData: FontAwesomeIcons.lock,
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    RegisterOrLogIn(
                      label1: 'ليس لديك حساب ؟',
                      label2: 'اضغط هنا لانشاء حساب',
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterView.id);
                      },
                    ),
                    const Spacer(),
                    BlocListener<CubitTeacher, QuesAppStatus>(
                      listener: (context, state) {
                        if (state is SuccessState) {
                          if (state.user!.password == password) {
                            BlocProvider.of<CubitSubject>(context)
                                .fetchSubject(state.user!.name);
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              HomeView.id,
                              (route) => false,
                            );
                          } else if (state is LoadingState) {
                            const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                showSnackBar(context, 'كلمة السر خاطئة'));
                          }
                        }
                      },
                      child: BlocBuilder<CubitTeacher, QuesAppStatus>(
                        builder: (context, state) {
                          return CustomButton(
                            iconData: Icons.login,
                            label: 'تسجيل الدخول',
                            onPressed: () {
                              if (globalKey.currentState!.validate()) {
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
