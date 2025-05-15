import 'package:dio/dio.dart';
import 'package:quran/features/Listening/data/model/reciter_info_model.dart';
import 'package:quran/features/Listening/domain/entity/reciter_info.dart';
import '../../../../core/errors/exception/exceptions.dart';

class ReciterInfoRemoteData {
  Future<ReciterInfoEntity> getReciters ({required String id})async{
    try{
      Dio dio = Dio(BaseOptions());
      final result = await dio.get("https://alquran.vip/APIs/reciterAudio?reciter_id=$id");
      return ReciterInfoModel.formJson(json: result.data);
    }on DioException{
      throw ServerException();
    }
  }
}