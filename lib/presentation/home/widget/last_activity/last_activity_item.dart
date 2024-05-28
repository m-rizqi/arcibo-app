import 'package:arcibo/generated/assets.dart';
import 'package:arcibo/presentation/style/arcibo_textstyle.dart';
import 'package:arcibo/util/constant/arcibo_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LastActivityItem extends StatelessWidget {
  LastActivityItem({super.key, this.width});

  final double? width;
  final double baseWidth = 196;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? baseWidth,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: const Color(0xFFFFDEAB),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: ARCIBOColor.yellowBrand,
          width: 2.r,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: width ?? baseWidth,
            height: width ?? baseWidth,
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              gradient: const RadialGradient(
                colors: [
                  Color(0xFFF7B511),
                  Color(0xFF613C04),
                  Color(0xFF411C0A),
                ],
                stops: [0, 0.64, 1.0],
              ),
            ),
            child: Center(
              child: Image.asset(
                Assets.imagesJoglo3dModel,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Senin, 17 Januari 2024',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: ARCIBOColor.blackBrand,
                    fontWeight: ARCIBOTextStyle.mediumWeight,
                    fontFamily: ARCIBOTextStyle.poppinsFamily,
                    fontSize: 14.sp,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '20.04 WIB',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: ARCIBOColor.grey2D,
                    fontWeight: ARCIBOTextStyle.regularWeight,
                    fontFamily: ARCIBOTextStyle.poppinsFamily,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.iconsIconCube,
                      colorFilter: const ColorFilter.mode(
                        ARCIBOColor.brownSecondaryBrand,
                        BlendMode.srcIn,
                      ),
                      width: 16.w,
                      height: 16.h,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: Text(
                        'Rumah Adat Joglo',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ARCIBOColor.grey2D,
                          fontWeight: ARCIBOTextStyle.mediumWeight,
                          fontFamily: ARCIBOTextStyle.poppinsFamily,
                          fontSize: 10.sp,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.iconsIconProgressBar,
                      colorFilter: const ColorFilter.mode(
                        ARCIBOColor.brownSecondaryBrand,
                        BlendMode.srcIn,
                      ),
                      width: 16.w,
                      height: 16.h,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: Text(
                        '1 Tahapan Lagi',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ARCIBOColor.grey2D,
                          fontWeight: ARCIBOTextStyle.mediumWeight,
                          fontFamily: ARCIBOTextStyle.poppinsFamily,
                          fontSize: 10.sp,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
