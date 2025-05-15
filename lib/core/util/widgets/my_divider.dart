import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/color_manager.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(vertical:5.h),
      child: Divider(
        height: 4.h,
        color: ColorManager.myBlue,
      ),
    );
  }
}
