import 'package:arcibo/generated/assets.dart';
import 'package:arcibo/presentation/style/arcibo_textstyle.dart';
import 'package:arcibo/util/constant/arcibo_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SurveyCard extends StatelessWidget {
  const SurveyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: ARCIBOColor.creamTertiaryContainer,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Container(
              width: 12.w,
              color: ARCIBOColor.brownBrand,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kritik dan Saran Buat ARCIBO',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: ARCIBOTextStyle.montserratFamily,
                        fontWeight: ARCIBOTextStyle.semiBoldWeight,
                        fontSize: 14.sp,
                        color: ARCIBOColor.brownBrand,
                      ),
                    ),
                    SizedBox(height: 4.h,),
                    Text(
                      'Apasih yang kurang dari ARCIBO ini, kasih tau dongg',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: ARCIBOTextStyle.poppinsFamily,
                        fontWeight: ARCIBOTextStyle.regularWeight,
                        fontSize: 12.sp,
                        color: ARCIBOColor.grey2D,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
