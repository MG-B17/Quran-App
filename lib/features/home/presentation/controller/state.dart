import 'package:quran/features/home/domain/entity/last_surah_play_entity.dart';

abstract class DBState {}

class DBInitialState extends DBState{}

class Loading extends DBState{}

class InsertIntoDBSuccess extends DBState{}

class InsertIntoDBFail extends DBState{}

class GetFromDBSuccess extends DBState{
 final List<LastSurahPlayEntity> data ;

  GetFromDBSuccess({required this.data});
}

class GetFromDBFail extends DBState{
  final String message ;

  GetFromDBFail({required this.message});
}

class DeleteDBSuccess extends DBState{}

class DeleteDBFail extends DBState{}