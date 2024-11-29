import 'package:news_bakry/models/SourceData.dart';

abstract class SourceState {}

class LoadingSourceState extends SourceState{}
class SuccessSourceState extends SourceState{
  List<Sources>sourceList;
  SuccessSourceState({required this.sourceList});
}
class ErrorSourceState extends SourceState{
  String errorMessage;
  ErrorSourceState({required this.errorMessage});
}