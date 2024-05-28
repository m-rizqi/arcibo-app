import 'package:arcibo/generated/assets.dart';
import 'package:arcibo/presentation/style/arcibo_textstyle.dart';
import 'package:arcibo/util/constant/arcibo_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class ARCIBOCollectionItem extends StatelessWidget {
  const ARCIBOCollectionItem({
    Key? key,
    this.isSelected = false,
  }) : super(key: key);

  final bool isSelected;

  //#region FUNCTION
  Color getBackgroundColor() {
    if (isSelected) return ARCIBOColor.brownBrand;
    return Colors.white;
  }

  Color getImageBackgroundColor() {
    if (isSelected) return ARCIBOColor.yellowBrand;
    return ARCIBOColor.brownBrand;
  }

  Color getSeriNumberTextColor() {
    if (isSelected) return ARCIBOColor.creamTertiaryContainer;
    return ARCIBOColor.brownBrand;
  }

  Color getSeriNameTextColor() {
    if (isSelected) return ARCIBOColor.whiteBrand;
    return ARCIBOColor.blackBrand;
  }

  Color getSeriOriginTextColor() {
    if (isSelected) return ARCIBOColor.creamPrimaryContainer;
    return ARCIBOColor.grey2D;
  }

  Color getLabelBackgroundColor(int index){
    if(isSelected){
      if (index % 2 == 0) return ARCIBOColor.creamPrimaryContainer;
      return ARCIBOColor.creamTertiaryContainer;
    }
    if (index % 2 == 0) return ARCIBOColor.brownBrand;
    return ARCIBOColor.yellowBrand;
  }

  Color getLabelTextColor(int index){
    if(isSelected){
      if (index % 2 == 0) return ARCIBOColor.brownBrand;
      return ARCIBOColor.brownBrand;
    }
    if (index % 2 == 0) return ARCIBOColor.yellowBrand;
    return ARCIBOColor.brownBrand;
  }

  //#endregion FUNCTION

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.all(12.r),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: getBackgroundColor(),
        boxShadow: [
          BoxShadow(
            color: ARCIBOColor.brownBrand.withOpacity(0.15), // Shadow color
            blurRadius: 8, // Blur radius
            offset: const Offset(-4, 4), // Offset position
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 92.w,
            height: 92.h,
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              color: getImageBackgroundColor(),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Center(
              child: Image.asset(Assets.imagesJoglo3dModel),
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Seri 1',
                  style: TextStyle(
                    fontFamily: ARCIBOTextStyle.poppinsFamily,
                    fontWeight: ARCIBOTextStyle.regularWeight,
                    fontSize: 12.sp,
                    color: getSeriNumberTextColor(),
                  ),
                ),
                Text(
                  'Rumah Adat Joglo',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: ARCIBOTextStyle.montserratFamily,
                    fontWeight: ARCIBOTextStyle.boldWeight,
                    fontSize: 16.sp,
                    color: getSeriNameTextColor(),
                  ),
                ),
                Text(
                  'Jawa Tengah',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: ARCIBOTextStyle.poppinsFamily,
                    fontWeight: ARCIBOTextStyle.mediumWeight,
                    fontSize: 14.sp,
                    color: getSeriOriginTextColor(),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 20.h,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return Container(
                        clipBehavior: Clip.hardEdge,
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: getLabelBackgroundColor(index),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          '3x dimainkan',
                          style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: ARCIBOTextStyle.mediumWeight,
                            fontFamily: ARCIBOTextStyle.poppinsFamily,
                            color: getLabelTextColor(index,),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return SizedBox(width: 8.w,);
                    },
                    itemCount: 3,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
