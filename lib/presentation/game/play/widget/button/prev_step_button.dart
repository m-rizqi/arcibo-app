import 'package:arcibo/util/constant/arcibo_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrevStepButton extends StatelessWidget {
  const PrevStepButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: ARCIBOColor.orangeBrand,
        shape: BoxShape.circle,
        border: Border.all(
          color: ARCIBOColor.brownBrand,
          width: 2.r,
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
        child: Icon(
          Icons.skip_previous_rounded,
          size: 28.r,
          color: ARCIBOColor.brownBrand,
        ),
      ),
    );
  }
}
