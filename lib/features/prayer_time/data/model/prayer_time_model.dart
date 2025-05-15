import 'package:quran/features/prayer_time/domain/entity/prayer_time_entity.dart';

class PrayerTimeModel extends PrayerTimeEntity{
  final Map<String,dynamic>times;
  final String date ;

  PrayerTimeModel({required this.date,required this.times}):super(timings:times ,date: date);

  factory PrayerTimeModel.formJson({required Map<String,dynamic> json}){
    return PrayerTimeModel(
        date:json["data"]["date"]["readable"],
        times:json["data"]["timings"]
    );
  }
}