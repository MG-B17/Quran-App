import 'package:dio/dio.dart';
import 'package:quran/core/errors/exception/exceptions.dart';
import 'package:quran/core/helper/api_helper/api_strings.dart';
import 'package:quran/core/helper/api_helper/dio_helper.dart';
import 'package:quran/features/chapter/data/model/chapter_model.dart';
import 'package:quran/features/chapter/domain/entity/chapter_entity.dart';

class ChapterRemoteData {

  Future<List<ChapterEntity>> getAllChapter()async{
    try{
      final result =await DioHelper.getData(endPoint:ApiStrings.chapterEndPoint, query: {});
      return ChapterModel.fromJsonList(result.data);
    }on DioException{
      throw ApiRequestsException();
    }

  }
}