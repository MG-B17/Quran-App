
import 'package:quran/core/errors/exception/exceptions.dart';
import 'package:quran/core/helper/sql_helper.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/entity/last_surah_play_entity.dart';

class LastPlayLocalData {

  Future<bool> insetLastSurahPlay({required LastSurahPlayEntity data})async{
    try{
      SqfliteHelper.insertIntoDB(data: data);
      return true;
    }on DatabaseException{
      throw ServerException();
    }

  }

  Future<List<LastSurahPlayEntity>> getLastSurahPlay()async{

    try{
      final result= await SqfliteHelper.getDataFromDB();
      return LastSurahPlayEntity.formJsonList(jsonList: result);
    }on DatabaseException{
      throw ServerException();
    }

  }
}