import 'package:arcibo/generated/assets.dart';
import 'package:arcibo/presentation/game/pick_seri/widget/arcibo_collection_item/arcibo_collection_item.dart';
import 'package:arcibo/presentation/game/play/view/game_play_page.dart';
import 'package:arcibo/presentation/style/arcibo_textstyle.dart';
import 'package:arcibo/presentation/widget/button/primary_button/arcibo_primary_button.dart';
import 'package:arcibo/presentation/widget/drawer/main_drawer.dart';
import 'package:arcibo/util/constant/arcibo_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GamePickSeriScreen extends StatefulWidget {
  @override
  State<GamePickSeriScreen> createState() => _GamePickSeriScreenState();
}

class _GamePickSeriScreenState extends State<GamePickSeriScreen> {
  double minChildSize = 0.60;
  double maxChildSize = 0.88;
  final scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
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
          child: Text(
            'Mau Main Seri Apa?',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: ARCIBOTextStyle.boldWeight,
              color: ARCIBOColor.whiteBrand,
              fontSize: 18.sp,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: (){
            scaffoldState.currentState?.openDrawer();
          },
          icon: Icon(
            Icons.menu_rounded,
            size: 24.r,
            color: ARCIBOColor.whiteBrand,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: ARCIBOColor.brownBrand,
          ),
          Column(
            children: [
              SizedBox(height: 96.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Image.asset(Assets.imagesIllustrationPickSeri),
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: minChildSize,
            minChildSize: minChildSize,
            maxChildSize: maxChildSize,
            snap: true,
            builder: (ctx, scrollController) {
              return Container(
                padding: EdgeInsets.only(
                  top: 16.h,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFEDD1),
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
                            color: ARCIBOColor.yellowBrand,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext ctx, int index) {
                          return const ARCIBOCollectionItem();
                        },
                        separatorBuilder: (BuildContext ctx, int index) {
                          return SizedBox(height: 12.h);
                        },
                        itemCount: 5,
                      ),
                      SizedBox(
                        height: 96.h,
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
              child: ARCIBOPrimaryButton(
                text: 'Cus Main👉',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    GamePlayPage.routeName,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
