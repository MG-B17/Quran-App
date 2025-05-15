import 'package:dartz/dartz.dart';
import 'package:quran/core/errors/exception/exceptions.dart';
import 'package:quran/core/errors/failure/failure.dart';
import 'package:quran/core/network/check_conntection/network_info.dart';
import 'package:quran/features/surah_content/data/remote_data/get_surah_remote_data.dart';
import 'package:quran/features/surah_content/domain/entity/surah_entity.dart';
import 'package:quran/features/surah_content/domain/repo/surah_repo.dart';

class SurahRepoImpl extends SurahRepo {
  final GetSurahRemoteData getSurahRemoteData;
  final NetworkInfo networkInfo;

  SurahRepoImpl({required this.networkInfo,required this.getSurahRemoteData});
  @override
  Future<Either<Failure, SurahEntity>> getSurah({required int num}) async{

    if(await networkInfo.isConnected()){
      try{
        final result = await getSurahRemoteData.getSurah(surahNumber: num);
        return right(result);
      }on ApiRequestsException{
        return left(ApiPredictionFailure());
      }
    }
    else{
      return left(OfflineFailure());
    }

  }
}