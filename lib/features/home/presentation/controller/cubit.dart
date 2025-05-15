import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/errors/map_failure_to_error_message.dart';
import 'package:quran/features/home/domain/entity/last_surah_play_entity.dart';
import 'package:quran/features/home/domain/usecase/get_last_surah_play.dart';
import 'package:quran/features/home/domain/usecase/insert_last_surah_play.dart';
import 'package:quran/features/home/presentation/controller/state.dart';

class DBCubit extends Cubit<DBState>{

  final GetLastSurahPlayUseCase getLastSurahPlayUseCase;
  final InsertLastSurahPlayUseCase insertLastSurahPlayUseCase;

  DBCubit({required this.insertLastSurahPlayUseCase,required this.getLastSurahPlayUseCase}):super(DBInitialState());

  static DBCubit get(context)=>BlocProvider.of(context);

  Future<void> getLastSurahPlay()async{
    final result =await getLastSurahPlayUseCase.call();
    result.fold((failure)=>emit(GetFromDBFail(message: mapFailureToMessage(failure))), (r)=>emit(GetFromDBSuccess(data: r)));
  }

  Future<void> insertLastPlaySurah ({required String url ,required id ,required String surahNameEn, required String  surahNameAr, required String restrictName})async{
    final entity = LastSurahPlayEntity(url: url, id: id, surahNameEn: surahNameEn, surahNameAr: surahNameAr, restrictName: restrictName);
    final result = await insertLastSurahPlayUseCase.call(data: entity);
    result.fold((failure)=>emit(InsertIntoDBFail()),(r){
      emit(InsertIntoDBSuccess());
      getLastSurahPlay();
    } );
}

}