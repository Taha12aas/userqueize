import 'package:userqueize/models/teacher.dart';

abstract class QuesAppStatus {}

class SuccessState extends QuesAppStatus {
  final Teacher? user;

  SuccessState({this.user});
}

class FaliureState extends QuesAppStatus {}

class LoadingState extends QuesAppStatus {}
