import 'package:quran/features/Listening/domain/entity/reciter_info.dart';
import 'package:quran/features/Listening/domain/entity/reciters_entity.dart';

abstract class RecitersState {}

class RecitersInitialState extends RecitersState{}

class LoadingGetReciters extends RecitersState{}

class GetRecitersSuccess extends RecitersState{
 final List<RecitersEntity> reciters;

 GetRecitersSuccess({required this.reciters});
}

class GetRecitersFail extends RecitersState{
  final String message ;

  GetRecitersFail({required this.message});
}

class LoadingGetRecitersInfo extends RecitersState{}

class GetRecitersInfoSuccess extends RecitersState{
  final ReciterInfoEntity reciterInfoEntity;

  GetRecitersInfoSuccess({required this.reciterInfoEntity});
}

class GetRecitersInfoFail extends RecitersState{
  final String message ;

  GetRecitersInfoFail({required this.message});
}
