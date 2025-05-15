import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/core/util/widgets/number_muslim_widegt.dart';

import '../../../../core/util/colors/color_manager.dart';

class ChapterItem extends StatelessWidget {
  const ChapterItem({super.key,required this.onTap,required this.surahArName,required this.surahEnName,required this.surahNumber,required this.verses});

 final String surahNumber;

 final String surahEnName;

 final String surahArName;

 final  String  verses;

 final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width:double.infinity,
        height:60.h,
        child: Row(
          spacing: 10.w,
          children: [
            NumberMuslimWidget(number: surahNumber),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  surahEnName,
                  style: TextStyle(
                      color:ColorManager.secondaryColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                   verses,
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              surahArName,
              style: TextStyle(
                  color:ColorManager.secondaryColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
