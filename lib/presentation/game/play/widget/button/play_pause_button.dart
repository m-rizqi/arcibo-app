import 'package:arcibo/util/constant/arcibo_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56.w,
      height: 56.h,
      decoration: BoxDecoration(
        color: ARCIBOColor.brownBrand,
        shape: BoxShape.circle,
        border: Border.all(
          color: ARCIBOColor.yellowBrand,
          width: 3.r,
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
          Icons.play_arrow_rounded,
          size: 40.r,
          color: ARCIBOColor.yellowBrand,
        ),
      ),
    );
  }
}
