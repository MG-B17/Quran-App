import 'package:dartz/dartz.dart';
import 'package:quran/core/errors/failure/failure.dart';
import 'package:quran/features/surah_content/domain/entity/surah_entity.dart';

abstract class SurahRepo {
  Future<Either<Failure,SurahEntity>> getSurah({required int num});
}