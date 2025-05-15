import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/util/colors/color_manager.dart';
import 'package:quran/core/util/padding/screen_padding.dart';
import 'package:quran/core/util/widgets/app_bar.dart';
import 'package:quran/core/util/widgets/loading.dart';
import 'package:quran/features/surah_content/presentation/controller/surah_cubit.dart';
import 'package:quran/features/surah_content/presentation/controller/surah_state.dart';
import 'package:quran/features/surah_content/presentation/widget/aya_widget.dart';
import 'package:quran/core/di/di.dart' as di;
import 'package:quran/features/surah_content/presentation/widget/surah_info.dart';

class SurahContent extends StatelessWidget {
  const SurahContent({super.key,required this.number});
  
  final int number;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>di.sl<SurahCubit>()..getSurah(num: number),
      child: BlocConsumer<SurahCubit,SurahState>(
        listener:(context,state){},
        builder:(context,state){
          if(state is GetAllSurahSuccess){
            return Scaffold(
              body: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: ColorManager.primaryColor
                ),
                child: Padding(
                  padding:AppPadding.screenPadding,
                  child: Column(
                    children: [
                      MyAppBar(text:state.result.surahName),
                      SizedBox(
                        height: 10.h,
                      ),
                      SurahInfo(
                          surahNameAr:state.result.surahName,
                          totalAya:"${state.result.totalAya}",
                          surahNameEn:state.result.surahNameEn,
                          place:state.result.revelationPlace,
                          surahAudioUrl: state.result.audioUrl,
                      ),
                      SizedBox(height: 20.h,),
                      Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount:state.result.totalAya,
                            itemBuilder:(context,index)=>AyaWidget(
                                ayaNum: "${index + 1}",
                                ayaAr:state.result.ayaAr[index],
                                ayaEn:state.result.ayaEn[index],
                                audioUrl: "audioUrl"
                            )
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }else if(state is LoadingGetSurah){
            return Container(
              decoration: BoxDecoration(
                gradient: ColorManager.primaryColor
              ),
              child: Center(
                child: spinKit,
              ),
            );
          }else{
            return SizedBox();
          }
        },
      ),
    );
  }
}
