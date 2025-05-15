import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/util/Strings/Strings.dart';
import 'package:quran/core/util/colors/color_manager.dart';
import 'package:quran/core/util/padding/screen_padding.dart';
import 'package:quran/core/util/widgets/app_bar.dart';
import 'package:quran/core/util/widgets/error_widget.dart';
import 'package:quran/core/util/widgets/icon_quran_image.dart';
import 'package:quran/core/util/widgets/loading.dart';
import 'package:quran/features/prayer_time/presentation/controller/prayer_time_cubit.dart';
import 'package:quran/features/prayer_time/presentation/controller/prayer_time_state.dart';
import 'package:quran/features/prayer_time/presentation/widgets/prayer_time_item.dart';

class PrayerTimeScreen extends StatelessWidget {
  const PrayerTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: ColorManager.primaryColor,
        ),
        child: Padding(
          padding:AppPadding.screenPadding,
          child: BlocConsumer<PrayerTimeCubit,PrayerTimeState>(
            listener:(context,state){},
            builder:(context,state){
              if(state is GetPrayerTimeSuccess){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10.h,
                  children: [
                    MyAppBar(text:AppStrings.prayerTiming),
                    IconQuranImage(),
                     Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: state.result.timings.length,
                            itemBuilder: (context,index)=>PrayerTimeItem(
                                prayName:state.result.timings.keys.elementAt(index),
                                time:state.result.timings.values.elementAt(index)
                            )
                        )
                    )
                  ],
                );
              }
              else if(state is LoadingGetPrayerTime){
                return Center(
                  child: spinKit,
                );
              }
              else if(state is GetPrayerTimeFail){
                return MyErrorWidget(text: state.message);
              }
              else{
                return SizedBox();
              }
            } ,
          ),
        ),
      ),
    );
  }
}
