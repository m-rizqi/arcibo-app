import 'package:arcibo/presentation/style/arcibo_textstyle.dart';
import 'package:arcibo/util/constant/arcibo_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinishedButton extends StatelessWidget {
  const FinishedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(48.r),
          border: Border.all(
            color: ARCIBOColor.whiteBrand,
            width: 3.r,
          ),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF129135),
              Color(0xFF0A6422),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: ARCIBOColor.blackBrand.withOpacity(0.25), // Shadow color
              blurRadius: 8, // Blur radius
              offset: const Offset(0, 4), // Offset position
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Yeay, Selesai',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              fontFamily: ARCIBOTextStyle.montserratFamily,
              color: ARCIBOColor.whiteBrand,
            ),
          ),
        ),
      ),
    );
  }
}
