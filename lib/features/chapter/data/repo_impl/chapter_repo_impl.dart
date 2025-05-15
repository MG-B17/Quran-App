import 'package:dartz/dartz.dart';
import 'package:quran/core/errors/exception/exceptions.dart';
import 'package:quran/core/errors/failure/failure.dart';
import 'package:quran/core/network/check_conntection/network_info.dart';
import 'package:quran/features/chapter/data/remote_data/chapter_remote_data.dart';
import 'package:quran/features/chapter/domain/entity/chapter_entity.dart';
import 'package:quran/features/chapter/domain/repo/chapter_repo.dart';

class ChapterRepoImpl extends ChapterRepo{
  final NetworkInfo networkInfo;
  final ChapterRemoteData chapterRemoteData;

  ChapterRepoImpl({required this.networkInfo,required this.chapterRemoteData});
  @override
  Future<Either<Failure, List<ChapterEntity>>> getAllChapter()async {
    if(await networkInfo.isConnected()){
      try{
        final result = await chapterRemoteData.getAllChapter();
        return right(result);
      }on ApiRequestsException{
        return left(ApiPredictionFailure());
      }
    }else{
      return left(OfflineFailure());
    }
  }


}