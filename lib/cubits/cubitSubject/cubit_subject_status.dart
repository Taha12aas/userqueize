import 'package:userqueize/models/subject.dart';

abstract class CubitSubjectStatus {}

class SuccessStatee extends CubitSubjectStatus {
  final List<SubjectsGenerated>? subjects;

  SuccessStatee({
    this.subjects,
  });
}

class FaliureStatee extends CubitSubjectStatus {}

class LoadingStatee extends CubitSubjectStatus {}
