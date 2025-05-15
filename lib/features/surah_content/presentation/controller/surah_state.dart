import 'package:quran/features/surah_content/domain/entity/surah_entity.dart';

abstract class SurahState {}

class InitialSurahState extends SurahState{}

class LoadingGetSurah extends SurahState{}

class GetAllSurahSuccess extends SurahState{
  final SurahEntity result ;

  GetAllSurahSuccess({required this.result});
}

class GetAllSurahFail extends SurahState{
  final String message ;

  GetAllSurahFail({required this.message});
}