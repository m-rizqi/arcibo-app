import 'package:arcibo/generated/assets.dart';
import 'package:arcibo/presentation/style/arcibo_textstyle.dart';
import 'package:arcibo/util/constant/arcibo_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeARCIBOCollection extends StatelessWidget {
  const HomeARCIBOCollection({
    super.key,
    this.width,
  });

  final double? width;
  final double baseWidth = 196;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? baseWidth,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [ARCIBOColor.yellowBrand, ARCIBOColor.brownBrand],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 0.68],
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: [
          SvgPicture.asset(
            Assets.imagesTraditionalPatternA,
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Color(0x1AFD8B4B),
              BlendMode.srcIn,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: Image.asset(
                      Assets.imagesJoglo3dModel,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  'Rumah Adat Joglo',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: ARCIBOTextStyle.montserratFamily,
                    fontWeight: ARCIBOTextStyle.semiBoldWeight,
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Jawa Tengah',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: ARCIBOTextStyle.poppinsFamily,
                    fontWeight: ARCIBOTextStyle.regularWeight,
                    fontSize: 12.sp,
                    color: ARCIBOColor.creamPrimaryContainer,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
