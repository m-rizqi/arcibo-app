import 'package:arcibo/generated/assets.dart';
import 'package:arcibo/presentation/game/play/widget/button/finished_button.dart';
import 'package:arcibo/presentation/game/play/widget/button/next_step_button.dart';
import 'package:arcibo/presentation/game/play/widget/button/play_pause_button.dart';
import 'package:arcibo/presentation/game/play/widget/button/prev_step_button.dart';
import 'package:arcibo/presentation/style/arcibo_textstyle.dart';
import 'package:arcibo/presentation/widget/drawer/main_drawer.dart';
import 'package:arcibo/util/constant/arcibo_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GamePlayScreen extends StatefulWidget {
  const GamePlayScreen({Key? key}) : super(key: key);

  @override
  _GamePlayScreenState createState() => _GamePlayScreenState();
}

class _GamePlayScreenState extends State<GamePlayScreen> {
  double minChildSize = 0.25;
  double maxChildSize = 0.88;
  final scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    final drawer = mainDrawer(context, scaffoldState.currentState);

    return Scaffold(
      key: scaffoldState,
      drawer: drawer,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 0.h),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              'Rumah Adat Joglo',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: ARCIBOTextStyle.boldWeight,
                color: ARCIBOColor.brownBrand,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            scaffoldState.currentState?.openDrawer();
          },
          icon: Icon(
            Icons.menu_rounded,
            size: 24.r,
            color: ARCIBOColor.brownBrand,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xFFE0E2E4),
          ),
          Column(
            children: [
              SizedBox(height: 72.h),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.only(left: 16.w, top: 16.h),
                      child: Column(
                        children: [
                          Icon(
                            Icons.flip_camera_android_rounded,
                            color: ARCIBOColor.brownBrand,
                            size: 24.r,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Icon(
                            Icons.help_outline_rounded,
                            color: ARCIBOColor.brownBrand,
                            size: 24.r,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 8.h),
                      child: Text(
                        '12:04 Menit',
                        style: TextStyle(
                          fontFamily: ARCIBOTextStyle.poppinsFamily,
                          fontWeight: ARCIBOTextStyle.mediumWeight,
                          fontSize: 10.sp,
                          color: ARCIBOColor.blackBrand,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Container(
                      width: 96.w,
                      height: 112.h,
                      margin: EdgeInsets.only(top: 8.h, right: 16.w),
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        gradient: const RadialGradient(
                          colors: [
                            Color(0xFFF7B511),
                            Color(0xFF613C04),
                            Color(0xFF411C0A),
                          ],
                          stops: [0, 0.64, 1.0],
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          Assets.imagesJoglo3dModel,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: minChildSize,
            minChildSize: minChildSize,
            maxChildSize: maxChildSize,
            snap: true,
            builder: (ctx, scrollController) {
              return Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 56.h),
                    child: Container(
                      height: double.infinity,
                      padding: EdgeInsets.only(
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
                              height: 16.h,
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h),
                      child: Row(
                        children: [
                          PrevStepButton(),
                          SizedBox(width: 8.w,),
                          PlayPauseButton(),
                          SizedBox(width: 8.w,),
                          NextStepButton(),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: const Row(
                        children: [
                          PrevStepButton(),
                          FinishedButton(),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
