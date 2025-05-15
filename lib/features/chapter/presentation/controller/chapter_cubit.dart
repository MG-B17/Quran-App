import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/errors/map_failure_to_error_message.dart';
import 'package:quran/features/chapter/domain/usecase/get_all_chapter_usecase.dart';
import 'package:quran/features/chapter/presentation/controller/chapter_state.dart';

class ChapterCubit extends Cubit<ChapterState>{
  final GetAllChapterUseCase getAllChapterUseCase;

  ChapterCubit({required this.getAllChapterUseCase}):super(InitialChapterState());

  static ChapterCubit get(context)=>BlocProvider.of(context);

  void getChapter()async{
    emit(LoadingGetChapter());
    final result = await getAllChapterUseCase.call();
    result.fold((failure)=>emit(GetAllChapterFail(message: mapFailureToMessage(failure))),(result)=>emit(GetAllChapterSuccess(result:result)));
  }
}