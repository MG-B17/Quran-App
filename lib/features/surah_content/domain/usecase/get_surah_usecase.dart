import 'package:dartz/dartz.dart';
import 'package:quran/core/errors/failure/failure.dart';
import 'package:quran/features/surah_content/domain/entity/surah_entity.dart';
import 'package:quran/features/surah_content/domain/repo/surah_repo.dart';

class GetSurahUseCase {
  final SurahRepo surahRepo ;

  GetSurahUseCase({required this.surahRepo});

  Future<Either<Failure,SurahEntity>>call({required int num})async{
    return await surahRepo.getSurah(num: num);
  }
}