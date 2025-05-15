import 'package:dartz/dartz.dart';
import 'package:quran/core/errors/failure/failure.dart';
import 'package:quran/features/home/domain/entity/last_surah_play_entity.dart';

abstract class LastSurahPlayRepo {
  Future<Either<Failure,List<LastSurahPlayEntity>>> getLastSurahPlay();

  Future<Either<Failure,bool>>insertLastSurahPlay({required LastSurahPlayEntity data});
}