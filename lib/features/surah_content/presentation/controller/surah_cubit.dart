import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/errors/map_failure_to_error_message.dart';
import 'package:quran/features/surah_content/domain/usecase/get_surah_usecase.dart';
import 'package:quran/features/surah_content/presentation/controller/surah_state.dart';

class SurahCubit extends Cubit<SurahState>{

  final GetSurahUseCase getSurahUseCase;

  SurahCubit({required this.getSurahUseCase}):super(InitialSurahState());

  static SurahCubit grt(context)=>BlocProvider.of(context);

  void getSurah({required int num})async{
    emit(LoadingGetSurah());
    final result = await getSurahUseCase.call(num: num);
    result.fold((failure)=>emit(GetAllSurahFail(message: mapFailureToMessage(failure))),(result)=>emit(GetAllSurahSuccess(result: result)));
  }
}