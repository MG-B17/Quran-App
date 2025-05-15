import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/util/colors/color_manager.dart';
import '../../../../core/util/widgets/my_divider.dart';

class PrayerTimeItem extends StatelessWidget {
  const PrayerTimeItem({super.key,required this.prayName,required this.time});

 final String time;

 final String prayName;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.h,
      children: [
        Row(
          children: [
            Text(
              prayName,
              style: TextStyle(
                  color: ColorManager.secondaryColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold
              ),
            ),
            const Spacer(),
            Text(
              time,
              style: TextStyle(
                  color: ColorManager.myBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp
              ),
            )
          ],
        ),
        MyDivider()
      ],
    );
  }
}
