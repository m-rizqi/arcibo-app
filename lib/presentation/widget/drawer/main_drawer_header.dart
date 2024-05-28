import 'package:arcibo/generated/assets.dart';
import 'package:arcibo/util/constant/arcibo_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainDrawerHeader extends StatelessWidget {
  const MainDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: ARCIBOColor.yellowBrand,
      ),
      child: Center(
        child: Transform.scale(
          scale: 0.8.r,
          child: SvgPicture.asset(
              Assets.iconsLogoTextHorizontal,
          ),
        ),
      ),
    );
  }
}
