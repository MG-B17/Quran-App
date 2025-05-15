import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:quran/core/network/check_conntection/network_info.dart';
import 'package:quran/features/Listening/data/remote_data/reciter_info_remote_data.dart';
import 'package:quran/features/Listening/data/remote_data/reciters_remote_data.dart';
import 'package:quran/features/Listening/data/repo_impl/repo_impl.dart';
import 'package:quran/features/Listening/domain/repo/reciters_repo.dart';
import 'package:quran/features/Listening/domain/usecase/get_reciter_info_use_case.dart';
import 'package:quran/features/Listening/domain/usecase/get_reciters_use_case.dart';
import 'package:quran/features/Listening/presentation/controller/cubit.dart';
import 'package:quran/features/chapter/data/remote_data/chapter_remote_data.dart';
import 'package:quran/features/chapter/data/repo_impl/chapter_repo_impl.dart';
import 'package:quran/features/chapter/domain/repo/chapter_repo.dart';
import 'package:quran/features/chapter/domain/usecase/get_all_chapter_usecase.dart';
import 'package:quran/features/chapter/presentation/controller/chapter_cubit.dart';
import 'package:quran/features/home/data/local_data/local_data.dart';
import 'package:quran/features/home/data/repo_impl/repo_impl.dart';
import 'package:quran/features/home/domain/repo/last_surah_play_repo.dart';
import 'package:quran/features/home/domain/usecase/get_last_surah_play.dart';
import 'package:quran/features/home/domain/usecase/insert_last_surah_play.dart';
import 'package:quran/features/home/presentation/controller/cubit.dart';
import 'package:quran/features/prayer_time/data/remote_data/prayer_time_remote_data.dart';
import 'package:quran/features/prayer_time/data/repo_impl/prayer_time_repo_impl.dart';
import 'package:quran/features/prayer_time/domain/repo/prayer_time_repo.dart';
import 'package:quran/features/prayer_time/domain/usecase/get_prayer_time_use_case.dart';
import 'package:quran/features/prayer_time/presentation/controller/prayer_time_cubit.dart';
import 'package:quran/features/surah_content/data/remote_data/get_surah_remote_data.dart';
import 'package:quran/features/surah_content/data/repo_impl/surah_repo_impl.dart';
import 'package:quran/features/surah_content/domain/repo/surah_repo.dart';
import 'package:quran/features/surah_content/domain/usecase/get_surah_usecase.dart';
import 'package:quran/features/surah_content/presentation/controller/surah_cubit.dart';

final sl = GetIt.instance;
Future<void> init()async{
  //cubit
  sl.registerLazySingleton<ChapterCubit>(()=>ChapterCubit(getAllChapterUseCase: sl())..getChapter());
  sl.registerFactory(()=>SurahCubit(getSurahUseCase: sl()));
  sl.registerLazySingleton<PrayerTimeCubit>(()=>PrayerTimeCubit(getPrayerTimeUseCase: sl())..getPrayerTime());
  sl.registerLazySingleton<RecitersCubit>(()=>RecitersCubit(getRecitersUseCase: sl(),getReciterInfoUseCase: sl()));
  sl.registerLazySingleton<DBCubit>(()=>DBCubit(insertLastSurahPlayUseCase: sl(), getLastSurahPlayUseCase: sl())..getLastSurahPlay());

  //useCases
  sl.registerLazySingleton<GetAllChapterUseCase>(()=>GetAllChapterUseCase(chapterRepo:sl()));
  sl.registerLazySingleton<GetSurahUseCase>(()=>GetSurahUseCase(surahRepo:sl()));
  sl.registerLazySingleton<GetPrayerTimeUseCase>(()=>GetPrayerTimeUseCase(prayerTimeRepo: sl()));
  sl.registerLazySingleton<GetRecitersUseCase>(()=>GetRecitersUseCase(recitersRepo: sl()));
  sl.registerLazySingleton<GetReciterInfoUseCase>(()=>GetReciterInfoUseCase(recitersRepo: sl()));
  sl.registerLazySingleton<InsertLastSurahPlayUseCase>(()=>InsertLastSurahPlayUseCase(lastSurahPlayRepo: sl()));
  sl.registerLazySingleton<GetLastSurahPlayUseCase>(()=>GetLastSurahPlayUseCase(lastSurahPlayRepo: sl()));

  //repo
  sl.registerLazySingleton<ChapterRepo>(()=>ChapterRepoImpl(networkInfo: sl(), chapterRemoteData:sl()));
  sl.registerLazySingleton<SurahRepo>(()=>SurahRepoImpl(networkInfo: sl(), getSurahRemoteData: sl()));
  sl.registerLazySingleton<PrayerTimeRepo>(()=>PrayerTimeRepoImpl(prayerTimeRemoteData: sl(), networkInfo: sl()));
  sl.registerLazySingleton<RecitersRepo>(()=>RecitersRepoImpl(recitersRemoteData: sl(), networkInfo:sl(),reciterInfoRemoteData: sl()));
  sl.registerLazySingleton<LastSurahPlayRepo>(()=>RepoImpl(lastPlayLocalData: sl()));

  //remoteData
  sl.registerLazySingleton<ChapterRemoteData>(()=>ChapterRemoteData());
  sl.registerLazySingleton<GetSurahRemoteData>(()=>GetSurahRemoteData());
  sl.registerLazySingleton<PrayerTimeRemoteData>(()=>PrayerTimeRemoteData());
  sl.registerLazySingleton<RecitersRemoteData>(()=>RecitersRemoteData());
  sl.registerLazySingleton<ReciterInfoRemoteData>(()=>ReciterInfoRemoteData());
  sl.registerLazySingleton<LastPlayLocalData>(()=>LastPlayLocalData());

  //network
  sl.registerLazySingleton<NetworkInfo>(()=>NetworkInfoImpl(internetConnection: InternetConnection()));
}