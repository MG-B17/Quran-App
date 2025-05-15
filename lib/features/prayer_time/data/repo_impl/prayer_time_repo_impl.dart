import 'package:dartz/dartz.dart';
import 'package:quran/core/errors/exception/exceptions.dart';
import 'package:quran/core/errors/failure/failure.dart';
import 'package:quran/core/network/check_conntection/network_info.dart';
import 'package:quran/features/prayer_time/data/remote_data/prayer_time_remote_data.dart';
import 'package:quran/features/prayer_time/domain/entity/prayer_time_entity.dart';
import 'package:quran/features/prayer_time/domain/repo/prayer_time_repo.dart';

class PrayerTimeRepoImpl extends PrayerTimeRepo{
  final NetworkInfo networkInfo;
  final PrayerTimeRemoteData prayerTimeRemoteData;

  PrayerTimeRepoImpl({required this.prayerTimeRemoteData,required this.networkInfo});

  @override
  Future<Either<Failure, PrayerTimeEntity>> getPrayerTime()async {
    if(await networkInfo.isConnected()){
      try{
        final result =await prayerTimeRemoteData.getPrayerTime();
        return right(result);
      }on ApiRequestsException{
        return left(ApiPredictionFailure());
      }
    }else{
      return left(OfflineFailure());
    }
  }


}