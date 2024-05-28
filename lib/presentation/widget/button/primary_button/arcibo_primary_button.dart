import 'package:arcibo/presentation/style/arcibo_textstyle.dart';
import 'package:arcibo/util/constant/arcibo_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ARCIBOPrimaryButton extends StatelessWidget {
  const ARCIBOPrimaryButton({
    required this.text,
    Key? key,
    this.onPressed,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 64.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(64.r),
          gradient: const LinearGradient(
            colors: [ARCIBOColor.yellowBrand, ARCIBOColor.brownBrand],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25), // Shadow color
              spreadRadius: 2, // Spread radius
              blurRadius: 8, // Blur radius
              offset: const Offset(0, 4), // Offset position
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.fade,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              fontFamily: ARCIBOTextStyle.montserratFamily,
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
