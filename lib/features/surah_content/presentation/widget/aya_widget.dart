import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/util/colors/color_manager.dart';
import '../../../../core/util/widgets/my_divider.dart';

class AyaWidget extends StatelessWidget {
  const AyaWidget({super.key,required this.ayaNum,required this.ayaAr,required this.ayaEn,required this.audioUrl});
  final String ayaNum;
  final String ayaAr ;
  final String audioUrl;
  final String ayaEn;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Column(
        spacing: 15.h,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            height: 50.h,
            decoration: BoxDecoration(
                color:ColorManager.indigoColor,
                borderRadius: BorderRadius.circular(10.r)
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                spacing: 5.w,
                children: [
                  CircleAvatar(
                    backgroundColor: ColorManager.myBlue,
                    radius: 20.r,
                    child: Text(
                      ayaNum,
                      style: TextStyle(
                          color: ColorManager.indigoColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(
                        Icons.bookmark_border,
                        size: 28.sp,
                        color: ColorManager.myBlue,
                      )
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  ayaAr,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      color: ColorManager.secondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  ayaEn,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      color: ColorManager.secondaryColor,
                      fontSize: 18.sp
                  ),
                ),
              ),
            ],
          ),
          MyDivider()
        ],
      ),
    );
  }
}
