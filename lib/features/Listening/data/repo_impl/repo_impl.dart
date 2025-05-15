import 'package:dartz/dartz.dart';
import 'package:quran/core/errors/exception/exceptions.dart';
import 'package:quran/core/errors/failure/failure.dart';
import 'package:quran/core/network/check_conntection/network_info.dart';
import 'package:quran/features/Listening/data/remote_data/reciter_info_remote_data.dart';
import 'package:quran/features/Listening/data/remote_data/reciters_remote_data.dart';
import 'package:quran/features/Listening/domain/entity/reciter_info.dart';
import 'package:quran/features/Listening/domain/entity/reciters_entity.dart';
import 'package:quran/features/Listening/domain/repo/reciters_repo.dart';

class RecitersRepoImpl extends RecitersRepo{

  final NetworkInfo networkInfo;

  final RecitersRemoteData recitersRemoteData;

  final ReciterInfoRemoteData reciterInfoRemoteData;

  RecitersRepoImpl({required this.recitersRemoteData,required this.networkInfo,required this.reciterInfoRemoteData});

  @override
  Future<Either<Failure, List<RecitersEntity>>> getReciters() async{
     if(await networkInfo.isConnected()){
       try{
        final result = await  recitersRemoteData.getReciters();
        return right(result);
       }on ServerException{
         return left(ServerFailure());
       }
     }else{
       return left(OfflineFailure());
     }
  }

  @override
  Future<Either<Failure, ReciterInfoEntity>> getRecitersInfo({required String id})async {
    if(await networkInfo.isConnected()){
    try{
    final result = await  reciterInfoRemoteData.getReciters(id: id);
    return right(result);
    }on ServerException{
    return left(ServerFailure());
    }
    }else{
    return left(OfflineFailure());
    }
  }

}