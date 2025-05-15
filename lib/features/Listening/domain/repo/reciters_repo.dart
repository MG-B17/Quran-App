import 'package:dartz/dartz.dart';
import 'package:quran/core/errors/failure/failure.dart';
import 'package:quran/features/Listening/domain/entity/reciter_info.dart';
import 'package:quran/features/Listening/domain/entity/reciters_entity.dart';

abstract class RecitersRepo {
  Future<Either<Failure,List<RecitersEntity>>> getReciters();

  Future<Either<Failure,ReciterInfoEntity>> getRecitersInfo({required String id});
}