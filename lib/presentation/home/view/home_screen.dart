import 'package:arcibo/generated/assets.dart';
import 'package:arcibo/presentation/global_key_route.dart';
import 'package:arcibo/presentation/home/widget/home_arcibo_colletion/home_arcibo_collection.dart';
import 'package:arcibo/presentation/home/widget/last_activity/last_activity_item.dart';
import 'package:arcibo/presentation/home/widget/survey_card/survey_card.dart';
import 'package:arcibo/presentation/style/arcibo_textstyle.dart';
import 'package:arcibo/presentation/widget/ads_banner/ads_banner.dart';
import 'package:arcibo/presentation/widget/button/primary_button/arcibo_primary_button.dart';
import 'package:arcibo/presentation/widget/drawer/main_drawer.dart';
import 'package:arcibo/util/constant/arcibo_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double minChildSize = 0.62;
  double maxChildSize = 0.88;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    final drawer = mainDrawer(context);

    return Scaffold(
      key: scaffoldKey,
      drawer: drawer,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(top: 0.h),
          child: Row(
            children: [
              Text(
                'Ayo Bermain ARCIBO',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  color: ARCIBOColor.brownBrand,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              const Icon(
                Icons.chevron_right_rounded,
                size: 24,
                color: ARCIBOColor.brownBrand,
              ),
            ],
          ),
        ),
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(
            Icons.menu_rounded,
            size: 24.r,
          ),
        ),
      ),
      body: Stack(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.tertiaryContainer,
              BlendMode.multiply,
            ),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets.imagesTraditionalPattern,
                  ),
                  fit: BoxFit.contain,
                  repeat: ImageRepeat.repeatY,
                  opacity: 0.7,
                ),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 96.h),
              AdsBanner(
                adsItems: [1, 2, 3],
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: minChildSize,
            minChildSize: minChildSize,
            maxChildSize: maxChildSize,
            snap: true,
            builder: (BuildContext ctx, ScrollController scrollController) {
              return Container(
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                  top: 16.h,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 96.w,
                          height: 6.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFC4C4C4),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Sedikit Lagi Selesai',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: ARCIBOTextStyle.montserratFamily,
                          fontWeight: ARCIBOTextStyle.semiBoldWeight,
                          color: ARCIBOColor.blackBrand,
                        ),
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      SizedBox(
                        height: 320.h,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext ctx, int index) {
                            return LastActivityItem();
                          },
                          separatorBuilder: (BuildContext ctx, int index) {
                            return SizedBox(width: 16.w);
                          },
                          itemCount: 5,
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Koleksi ARCIBO Kamu',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: ARCIBOTextStyle.montserratFamily,
                              fontWeight: ARCIBOTextStyle.semiBoldWeight,
                              color: ARCIBOColor.blackBrand,
                            ),
                          ),
                          Text(
                            'Lihat Semua',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: ARCIBOTextStyle.poppinsFamily,
                              fontWeight: ARCIBOTextStyle.regularWeight,
                              color: ARCIBOColor.brownBrand,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        height: 240.h,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext ctx, int index) {
                            return const HomeARCIBOCollection();
                          },
                          separatorBuilder: (BuildContext ctx, int index) {
                            return SizedBox(width: 16.w);
                          },
                          itemCount: 5,
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        'Gabut? Isi Survey Aja',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: ARCIBOTextStyle.montserratFamily,
                          fontWeight: ARCIBOTextStyle.semiBoldWeight,
                          color: ARCIBOColor.blackBrand,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext ctx, int index) {
                          return const SurveyCard();
                        },
                        separatorBuilder: (BuildContext ctx, int index) {
                          return SizedBox(height: 8.h);
                        },
                        itemCount: 5,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                bottom: 24.h,
              ),
              child: const ARCIBOPrimaryButton(text: 'Ayo Rakit ARCIBO✊',),
            ),
          ),
        ],
      ),
    );
  }
}
