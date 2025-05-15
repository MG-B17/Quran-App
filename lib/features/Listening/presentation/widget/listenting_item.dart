import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/colors/color_manager.dart';

class ListeningItem extends StatelessWidget {
  const ListeningItem({super.key,required this.name,required this.onTap});

  final String name;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.myBlue, width: 2.5.w),
          borderRadius: BorderRadius.circular(12.w), // Adjust radius as needed
        ),
        child: Padding(
          padding:EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 10.w,
            children: [
              Text(
                name,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    color: ColorManager.secondaryColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold
                ),
              ),
              Icon(
                Icons.play_circle_outline,
                color: ColorManager.secondaryColor,
                size: 28.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
