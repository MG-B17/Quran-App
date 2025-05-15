import 'package:dartz/dartz.dart';
import 'package:quran/core/errors/failure/failure.dart';
import 'package:quran/features/chapter/domain/entity/chapter_entity.dart';

abstract class ChapterRepo {

  Future<Either<Failure,List<ChapterEntity>>> getAllChapter();
}