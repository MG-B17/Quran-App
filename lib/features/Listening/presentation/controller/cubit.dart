import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/config/navigation/navigator_class.dart';
import 'package:quran/core/errors/map_failure_to_error_message.dart';
import 'package:quran/features/Listening/domain/usecase/get_reciter_info_use_case.dart';
import 'package:quran/features/Listening/domain/usecase/get_reciters_use_case.dart';
import 'package:quran/features/Listening/presentation/controller/states.dart';
import 'package:quran/features/Listening/presentation/screen/reciter_audio.dart';

class RecitersCubit extends Cubit<RecitersState>{
  final GetRecitersUseCase getRecitersUseCase;

  final GetReciterInfoUseCase getReciterInfoUseCase;

  static RecitersCubit get(context)=>BlocProvider.of(context);

  RecitersCubit({required this.getRecitersUseCase,required this.getReciterInfoUseCase}):super(RecitersInitialState());

  void getReciters()async{
    emit(LoadingGetReciters());
    final result = await getRecitersUseCase.call();
    result.fold((failure)=>emit(GetRecitersFail(message: mapFailureToMessage(failure))),
        (result)=>emit(GetRecitersSuccess(reciters: result))
    );
  }

  void getRecitersInfo({required String id,context})async{
    PushNavigation().navigation(context: context, screen: ReciterAudio());
    emit(LoadingGetRecitersInfo());
    final result = await getReciterInfoUseCase.call(id: id);
    result.fold((failure)=>emit(GetRecitersInfoFail(message: mapFailureToMessage(failure))),
            (result)=>emit(GetRecitersInfoSuccess(reciterInfoEntity: result))
    );
  }
}