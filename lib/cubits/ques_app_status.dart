import 'package:userqueize/models/subject.dart';
import 'package:userqueize/models/teacher.dart';

abstract class QuesAppStatus {}

class SuccessState extends QuesAppStatus {
  final Teacher? user;
  final List<SubjectsGenerated>? subjects;

  SuccessState({
    this.subjects,
    this.user,
  });
}

class FaliureState extends QuesAppStatus {

}

class LoadingState extends QuesAppStatus {}
