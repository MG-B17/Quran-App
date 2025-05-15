import 'package:dartz/dartz.dart';
import 'package:quran/features/Listening/domain/entity/reciter_info.dart';
import 'package:quran/features/Listening/domain/repo/reciters_repo.dart';
import '../../../../core/errors/failure/failure.dart';

class GetReciterInfoUseCase {
  final RecitersRepo recitersRepo;

  GetReciterInfoUseCase({required this.recitersRepo});

  Future<Either<Failure,ReciterInfoEntity>> call({required String id})async{
    return await recitersRepo.getRecitersInfo(id: id);
  }
}