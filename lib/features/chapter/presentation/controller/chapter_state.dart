import 'package:quran/features/chapter/domain/entity/chapter_entity.dart';

abstract class ChapterState {}

class InitialChapterState extends ChapterState{}

class LoadingGetChapter extends ChapterState{}

class GetAllChapterSuccess extends ChapterState{
  final List<ChapterEntity> result ;

  GetAllChapterSuccess({required this.result});
}

class GetAllChapterFail extends ChapterState{
  final String message ;

  GetAllChapterFail({required this.message});
}