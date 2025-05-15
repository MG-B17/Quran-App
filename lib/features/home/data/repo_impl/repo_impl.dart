import 'package:dartz/dartz.dart';
import 'package:quran/core/errors/exception/exceptions.dart';
import 'package:quran/core/errors/failure/failure.dart';
import 'package:quran/features/home/data/local_data/local_data.dart';
import 'package:quran/features/home/domain/entity/last_surah_play_entity.dart';
import 'package:quran/features/home/domain/repo/last_surah_play_repo.dart';

class RepoImpl extends LastSurahPlayRepo {
  final LastPlayLocalData lastPlayLocalData;

  RepoImpl({required this.lastPlayLocalData});
  @override
  Future<Either<Failure, List<LastSurahPlayEntity>>> getLastSurahPlay()async {
    try{
     final result = await lastPlayLocalData.getLastSurahPlay();
     return right(result);
    }on ServerException{
      return  left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> insertLastSurahPlay({required LastSurahPlayEntity data})async {
    try{
      final result = await lastPlayLocalData.insetLastSurahPlay(data: data);
      return right(result);
    }on ServerException {
      return left(ServerFailure());
    }
  }
}