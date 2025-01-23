import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/home_view/list_view_item_card_subject.dart';
import 'package:userqueize/Mobile/widgets/home_view/main_sections.dart';
import 'package:userqueize/cubits/cubitSubject/cubit_subject.dart';
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
  final ValueNotifier<bool> _isConnected = ValueNotifier(true);
  final ValueNotifier<bool> _showOnlineBanner = ValueNotifier(false);

  @override
  void initState() {
    BlocProvider.of<CubitTeacher>(context).fetchUsers(CubitTeacher.user.phone);
    BlocProvider.of<CubitSubject>(context).fetchSubject(CubitTeacher.user.name);
    super.initState();
  }

  void _handleConnectivityChange(bool isConnected) {
    if (_isConnected.value != isConnected) {
      _isConnected.value = isConnected;

      if (isConnected) {
        _showOnlineBanner.value = true;

        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) {
            _showOnlineBanner.value = false;
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitTeacher, QuesAppStatus>(
      builder: (context, state) {
        if (state is SuccessState) {
          return Scaffold(
            appBar: mainAppBar('الصفحة الرئيسية', context),
            body: OfflineBuilder(
              connectivityBuilder: (context, connectivity, child) {
                final bool connected =
                    !connectivity.contains(ConnectivityResult.none);
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _handleConnectivityChange(connected);
                });

                return ValueListenableBuilder<bool>(
                  valueListenable: _isConnected,
                  builder: (context, isConnected, _) {
                    return Column(
                      children: [
                        ValueListenableBuilder<bool>(
                          valueListenable: _showOnlineBanner,
                          builder: (context, showOnlineBanner, _) {
                            if (showOnlineBanner) {
                              return Container(
                                height: 24.0,
                                color: const Color(0xFF00EE44),
                                child: const Center(
                                  child: Text(
                                    'ONLINE',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                        if (!isConnected)
                          Container(
                            height: 24.0,
                            color: const Color(0xFFEE4400),
                            child: const Center(
                              child: Text(
                                'OFFLINE',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        Expanded(child: child),
                      ],
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const MainSections(),
                    const SizedBox(height: 20),
                    Container(
                      width: 158,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(Icons.trending_up, color: kOrange),
                            const SizedBox(width: 8),
                            Text(
                              "أحدث النشاطات",
                              style: TextStyle(
                                fontSize: getResponsiveText(context, 18),
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const ListViewItemCardSubject(),
                  ],
                ),
              ),
            ),
          );
        } else if (state is LoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: kOrange,
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '😉 تأكد من اتصالك بالانترنت ',
                  style: FontStyleApp.orangeBold25
                      .copyWith(fontSize: getResponsiveText(context, 25)),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .5,
                  child: CustomButton(
                    title: 'حاول مجدداً',
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        HomeView.id,
                        (route) => false,
                      );
                    },
                  ),
                )
              ],
            )),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _isConnected.dispose();
    _showOnlineBanner.dispose();
    super.dispose();
  }
}
