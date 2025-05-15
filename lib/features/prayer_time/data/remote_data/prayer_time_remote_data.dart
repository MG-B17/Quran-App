import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:quran/core/errors/exception/exceptions.dart';
import 'package:quran/features/prayer_time/data/model/prayer_time_model.dart';
import 'package:quran/features/prayer_time/domain/entity/prayer_time_entity.dart';

class PrayerTimeRemoteData {
  Future<PrayerTimeEntity> getPrayerTime()async{
    try{
      Dio dio = Dio();
      DateTime date = DateTime.now();
      String formattedDate = DateFormat('dd-MM-yyyy').format(date);
      final result = await dio.get("https://api.aladhan.com/v1/timingsByCity/$formattedDate?city=Dikahlia&country=Egypt&state=Mansoura&method=3&calendarMethod=UAQ");
      print(result.data);
      return PrayerTimeModel.formJson(json: result.data);
    }on DioException{
      throw ApiRequestsException();
    }
  }
}