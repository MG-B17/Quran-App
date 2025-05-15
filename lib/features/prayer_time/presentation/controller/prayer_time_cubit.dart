import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/errors/map_failure_to_error_message.dart';
import 'package:quran/features/prayer_time/domain/usecase/get_prayer_time_use_case.dart';
import 'package:quran/features/prayer_time/presentation/controller/prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState>{

  final GetPrayerTimeUseCase getPrayerTimeUseCase;

  PrayerTimeCubit({required this.getPrayerTimeUseCase}):super(InitialPrayerTimeState());

  static PrayerTimeCubit get(context)=>BlocProvider.of(context);

  void getPrayerTime ()async{
    emit(LoadingGetPrayerTime());
    final result = await getPrayerTimeUseCase.call();

    result.fold((failure)=>emit(GetPrayerTimeFail(message: mapFailureToMessage(failure))),(result)=>emit(GetPrayerTimeSuccess(result: result)));
  }
}