import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/config/navigation/navigator_class.dart';
import 'package:quran/core/util/Strings/Strings.dart';
import 'package:quran/core/util/colors/color_manager.dart';
import 'package:quran/core/util/padding/screen_padding.dart';
import 'package:quran/core/util/widgets/app_bar.dart';
import 'package:quran/features/Azkar/data/local_data/json_azkar.dart';
import 'package:quran/features/Azkar/presentation/screen/azkar_screen/azkar_content.dart';
import 'package:quran/features/Azkar/presentation/widget/azkar_item.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});


  @override
  Widget build(BuildContext context) {
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
             MyAppBar(text: AppStrings.recitation),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 3.0.h,
                      crossAxisSpacing: 20.0.w,
                      childAspectRatio: 1 / 1.h,
                    ),
                    itemBuilder:(context,index)=>AzkarItem(
                        onTap:(){
                          PushNavigation().navigation(context: context, screen: AzkarContent(json:azakrJson[index],name:azkarNameAr[index],image:azkarImage[index],));
                        },
                        image:azkarImage[index],
                        text1:azkarNameAr[index],
                        text2:azkarNameEn[index]
                    ),
                  itemCount: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
