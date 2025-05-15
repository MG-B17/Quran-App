import 'package:quran/features/prayer_time/domain/entity/prayer_time_entity.dart';

abstract class PrayerTimeState {}

class InitialPrayerTimeState extends PrayerTimeState{}

class LoadingGetPrayerTime extends PrayerTimeState{}

class GetPrayerTimeSuccess extends PrayerTimeState{
  final PrayerTimeEntity result ;

  GetPrayerTimeSuccess({required this.result});
}
class GetPrayerTimeFail extends PrayerTimeState{
  final String message;

  GetPrayerTimeFail({required this.message});
}