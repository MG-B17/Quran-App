import 'package:dio/dio.dart';
import 'package:quran/core/errors/exception/exceptions.dart';
import 'package:quran/features/Listening/data/model/reciters_model.dart';
import 'package:quran/features/Listening/domain/entity/reciters_entity.dart';

class RecitersRemoteData {

  Future<List<RecitersEntity>> getReciters ()async{
    try{
      Dio dio = Dio(BaseOptions());
      final result = await dio.get("https://alquran.vip/APIs/reciters");
      return RecitersModel.formJsonList(jsonList: result.data["reciters"]);
    }on DioException{
      throw ServerException();
    }
  }
}