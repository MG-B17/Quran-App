import 'package:dio/dio.dart';
import 'package:quran/core/helper/api_helper/api_strings.dart';

abstract class DioHelper{
 static Dio ? dio ;

  static initDio(){
    dio = Dio(
        BaseOptions(
              baseUrl: ApiStrings.baseUrl,
              receiveDataWhenStatusError: true,
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
              })
    );
  }

  static getData({required String endPoint,required Map<String,dynamic>? query})async{
    final result = await dio!.get(endPoint,queryParameters: query);
    return result;
  }
}