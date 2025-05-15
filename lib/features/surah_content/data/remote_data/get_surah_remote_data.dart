import 'package:dio/dio.dart';
import 'package:quran/core/errors/exception/exceptions.dart';
import 'package:quran/core/helper/api_helper/dio_helper.dart';
import 'package:quran/features/surah_content/data/model/surah_model.dart';
import 'package:quran/features/surah_content/domain/entity/surah_entity.dart';

class GetSurahRemoteData {
  Future<SurahEntity> getSurah({required int surahNumber})async{
    try{
      final result = await DioHelper.getData(endPoint:"api/$surahNumber.json", query: {});
      return SurahModel.formJson(json: result.data);
    }on DioException{
      throw ApiRequestsException();
    }
  }
}