import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/di/di.dart' as di;
import 'package:quran/features/Listening/presentation/controller/cubit.dart';
import 'package:quran/features/chapter/presentation/controller/chapter_cubit.dart';
import 'package:quran/features/home/presentation/controller/cubit.dart';
import 'package:quran/features/home/presentation/screen/home_screen.dart';
import 'package:quran/features/prayer_time/presentation/controller/prayer_time_cubit.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context)=>di.sl<DBCubit>()),
            BlocProvider(create: (context)=>di.sl<ChapterCubit>()),
            BlocProvider(create: (context)=>di.sl<PrayerTimeCubit>()),
            BlocProvider(create: (context)=>di.sl<RecitersCubit>()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home:HomeScreen(),
          ),
        );
      },
    );
  }
}
