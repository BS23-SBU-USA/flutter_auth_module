import 'package:auth_module/src/core/theme/theme.dart';
import 'package:auth_module/src/core/theme/typography/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildTitleAndSubtitle extends StatelessWidget {
  const BuildTitleAndSubtitle({
    required this.titleFirstPart,
    required this.titleLastPart,
    required this.subtitleFirstPart,
    required this.subtitleLastPart,
    super.key,
  });

  final String titleFirstPart;
  final String titleLastPart;
  final String subtitleFirstPart;
  final String subtitleLastPart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Positioned(
                  bottom: -2,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 8.h,
                    color: UIColors.lightTeal,
                  ),
                ),
                Text(
                  titleFirstPart,
                  style: AppTypography.bold18(
                    color: UIColors.black,
                  ),
                ),
              ],
            ),
            Text(
              titleLastPart,
              style: AppTypography.bold18(
                color: UIColors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Text(
          '$subtitleFirstPart\n$subtitleLastPart',
          style: AppTypography.regular14(
            color: UIColors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
