import 'package:dartz/dartz.dart';
import 'package:quran/core/errors/failure/failure.dart';
import 'package:quran/features/home/domain/entity/last_surah_play_entity.dart';
import 'package:quran/features/home/domain/repo/last_surah_play_repo.dart';

class GetLastSurahPlayUseCase {
  final LastSurahPlayRepo lastSurahPlayRepo;

  GetLastSurahPlayUseCase({required this.lastSurahPlayRepo});

  Future<Either<Failure,List<LastSurahPlayEntity>>>call()async{
    return lastSurahPlayRepo.getLastSurahPlay();
  }
}