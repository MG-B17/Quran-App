import 'package:dartz/dartz.dart';
import 'package:quran/core/errors/failure/failure.dart';
import 'package:quran/features/chapter/domain/entity/chapter_entity.dart';
import 'package:quran/features/chapter/domain/repo/chapter_repo.dart';

class GetAllChapterUseCase {
  final ChapterRepo chapterRepo;

  GetAllChapterUseCase({required this.chapterRepo});

  Future<Either<Failure,List<ChapterEntity>>> call()async{
    return await chapterRepo.getAllChapter();
  }
}