import 'package:dartz/dartz.dart';
import 'package:quran/core/errors/failure/failure.dart';
import 'package:quran/features/Listening/domain/entity/reciters_entity.dart';
import 'package:quran/features/Listening/domain/repo/reciters_repo.dart';

class GetRecitersUseCase {
  final RecitersRepo recitersRepo;

  GetRecitersUseCase({required this.recitersRepo});

  Future<Either<Failure,List<RecitersEntity>>> call ()async{
    return await recitersRepo.getReciters();
  }
}