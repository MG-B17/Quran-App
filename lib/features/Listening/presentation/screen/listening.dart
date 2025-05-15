import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/util/Strings/Strings.dart';
import 'package:quran/core/util/colors/color_manager.dart';
import 'package:quran/core/util/padding/screen_padding.dart';
import 'package:quran/core/util/widgets/app_bar.dart';
import 'package:quran/core/util/widgets/loading.dart';
import 'package:quran/features/Listening/domain/entity/reciters_entity.dart';
import 'package:quran/features/Listening/presentation/controller/cubit.dart';
import 'package:quran/features/Listening/presentation/controller/states.dart';
import 'package:quran/features/Listening/presentation/widget/listenting_item.dart';


class Listening extends StatelessWidget {
  Listening({super.key});
   List<RecitersEntity> reciters =[];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecitersCubit,RecitersState>(
      listener:(context,state){
        if(state is GetRecitersSuccess){
          reciters = state.reciters;
        }
      },
      builder:(context,state){
        return Scaffold(
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: ColorManager.primaryColor,
            ),
            child: Padding(
              padding: AppPadding.screenPadding,
              child: Column(
                children: [
                  MyAppBar(text: AppStrings.listening),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        state is LoadingGetReciters? Center(child: spinKit):  reciters.isNotEmpty ? Expanded(
                          child: ListView.separated(
                              padding: EdgeInsets.zero,
                              itemBuilder:(context,index)=>SizedBox(height: 15.h,),
                              separatorBuilder:(context,index)=>ListeningItem(
                                  name:reciters[index].name,
                                  onTap: (){
                                    RecitersCubit.get(context).getRecitersInfo(context: context,id:reciters[index].id);
                                  }),
                              itemCount:reciters.length
                          ),) : SizedBox()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
