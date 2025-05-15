import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/config/navigation/navigator_class.dart';
import 'package:quran/core/util/Strings/Strings.dart';
import 'package:quran/core/util/colors/color_manager.dart';
import 'package:quran/core/util/padding/screen_padding.dart';
import 'package:quran/core/util/widgets/icon_quran_image.dart';
import 'package:quran/features/Azkar/presentation/screen/azkar_screen/azkar_screen.dart';
import 'package:quran/features/Listening/presentation/controller/cubit.dart';
import 'package:quran/features/Listening/presentation/screen/listening.dart';
import 'package:quran/features/chapter/presentation/screen/chapter.dart';
import 'package:quran/features/home/presentation/widgets/last_play.dart';
import 'package:quran/core/util/widgets/section_widget.dart';
import 'package:quran/features/prayer_time/presentation/screen/prayer_time_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient:ColorManager.primaryColor
        ),
        child: Padding(
          padding:AppPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 12.h,
              ),
              IconQuranImage(),
              LastPlay(),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 10.w,
                children: [
                  SectionWidget(
                      onTap: (){
                        PushNavigation().navigation(context: context, screen: Chapter());
                      },
                      image:"assets/images/Quran.png",
                      text1: AppStrings.quran,
                      text2: AppStrings.quranAr
                  ),
                  SectionWidget(
                      onTap: (){
                        PushNavigation().navigation(context: context, screen: Listening());
                        RecitersCubit.get(context).getReciters();
                      },
                      image:"assets/images/listen.png",
                      text1:AppStrings.listening,
                      text2: ""
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 10.w,
                children: [
                  SectionWidget(
                      onTap: (){
                        PushNavigation().navigation(context: context, screen:PrayerTimeScreen());
                      },
                      image:"assets/images/prayer_time.png",
                      text1: AppStrings.prayerTiming,
                      text2:AppStrings.prayerTimingAr,
                  ),
                  SectionWidget(
                      onTap: (){
                        PushNavigation().navigation(context: context, screen:AzkarScreen());
                      },
                      image:"assets/images/seb7a.png",
                      text1: AppStrings.recitation,
                      text2: AppStrings.recitationAr
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
