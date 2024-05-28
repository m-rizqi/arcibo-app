import 'package:arcibo/presentation/style/arcibo_textstyle.dart';
import 'package:arcibo/util/constant/arcibo_color.dart';
import 'package:arcibo/util/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainDrawerItem extends StatelessWidget {
  const MainDrawerItem({
    super.key,
    required this.iconSvg,
    required this.title,
    required this.path,
    this.requestColor,
  });

  final String iconSvg;

  final String title;

  final String path;

  final Color? requestColor;

  //#region FUNCTION
  Color getItemColor(BuildContext context){
    if (requestColor != null) return requestColor!;
    if (AppNavigator.getCurrentRouteName(context) == path) {
      return ARCIBOColor.whiteBrand;
    }
    return ARCIBOColor.grey2D;
  }

  Color getBackgroundColor(BuildContext context){
    if (requestColor != null) return Colors.transparent;
    if (AppNavigator.getCurrentRouteName(context) == path) {
      return ARCIBOColor.brownBrand;
    }
    return Colors.transparent;
  }
  
  TextStyle getTextStyle(BuildContext context) {
    if (AppNavigator.getCurrentRouteName(context) == path) {
      return TextStyle(
        color: getItemColor(context),
        fontFamily: 'Poppins',
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      );
    }

    return TextStyle(
      color: getItemColor(context),
      fontFamily: 'Poppins',
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    );
  }
  //#endregion FUNCTION

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, path);
      },
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: getBackgroundColor(context),
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 16.h,
              child: SvgPicture.asset(
                iconSvg,
                colorFilter: ColorFilter.mode(
                  getItemColor(context),
                  BlendMode.srcIn,
                ),
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
              child: Text(
                title,
                style: getTextStyle(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
