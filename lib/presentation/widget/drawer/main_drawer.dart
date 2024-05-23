import 'package:arcibo/generated/assets.dart';
import 'package:arcibo/presentation/home/view/home_page.dart';
import 'package:arcibo/presentation/widget/drawer/main_drawer_header.dart';
import 'package:arcibo/presentation/widget/drawer/main_drawer_item.dart';
import 'package:arcibo/util/constant/arcibo_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Drawer mainDrawer(BuildContext context) {
  final drawerItems = _drawerItems(context);
  return Drawer(
    backgroundColor: Theme.of(context).colorScheme.background,
    child: Column(
      children: [
        const MainDrawerHeader(),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 0.h),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return drawerItems[index];
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 8.h,
                  );
                },
                itemCount: drawerItems.length,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Text(
            'v.1.0.0',
            style: TextStyle(
              color: ARCIBOColor.blackBrand,
              fontFamily: 'Poppins',
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        )
      ],
    ),
  );
}

List<MainDrawerItem> _drawerItems(BuildContext context) {
  return [
    const MainDrawerItem(
      iconSvg: Assets.iconsIconHouse,
      title: 'Beranda',
      path: HomePage.routeName,
    ),
    const MainDrawerItem(
      iconSvg: Assets.iconsIconCube,
      title: 'Koleksi ARCIBO',
      path: '/gallery',
    ),
    const MainDrawerItem(
      iconSvg: Assets.iconsIconUser,
      title: 'Profil',
      path: '/gallery',
    ),
    const MainDrawerItem(
      iconSvg: Assets.iconsIconGear,
      title: 'Pengaturan',
      path: '/settings',
    ),
    MainDrawerItem(
      iconSvg: Assets.iconsIconExit,
      title: 'Keluar',
      path: '/logout',
      requestColor: Theme.of(context).colorScheme.error,
    ),
  ];
}
