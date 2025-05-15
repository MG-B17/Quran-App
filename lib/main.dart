import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/di/di.dart';
import 'package:quran/core/helper/api_helper/dio_helper.dart';
import 'package:quran/core/helper/sql_helper.dart';
import 'package:quran/quran.dart';

import 'config/bloc_observer.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  await ScreenUtil.ensureScreenSize();

  init();

  await SqfliteHelper.createDatabase();

  DioHelper.initDio();

  runApp(Quran());
}
