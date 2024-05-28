import 'package:arcibo/presentation/widget/ads_banner/ads_banner_item.dart';
import 'package:arcibo/presentation/widget/dots_indicator/animated_dots_indicator.dart';
import 'package:arcibo/util/constant/arcibo_color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdsBanner extends StatefulWidget {
  AdsBanner({
    super.key,
    this.activeDotIndicatorColor = ARCIBOColor.brownBrand,
    this.inActiveDotIndicatorColor = const Color(0xffffffff),
    required this.adsItems,
  });

  final Color activeDotIndicatorColor;
  final Color inActiveDotIndicatorColor;
  final List<dynamic> adsItems;

  @override
  State<AdsBanner> createState() => _AdsBannerState();
}

class _AdsBannerState extends State<AdsBanner> {
  int currentIndex = 0;
  final controller = CarouselController();
  final adsDuration = const Duration(seconds: 3);

  //#region FUNCTION
  bool isAdsMoreThanOne() => widget.adsItems.length > 1;
  //#endregion FUNCTION

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: controller,
          items: widget.adsItems.map((ads) => AdsBannerItem(adsBannerModel: ads)).toList(),
          options:  CarouselOptions(
            autoPlay: isAdsMoreThanOne(),
            viewportFraction: isAdsMoreThanOne() ? 0.8 : 1,
            enableInfiniteScroll: isAdsMoreThanOne(),
            enlargeCenterPage: true,
            autoPlayInterval: adsDuration,
            aspectRatio: 16 / 7,
            enlargeFactor: 0.2,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        Visibility(
          visible: isAdsMoreThanOne(),
          child: Column(
            children: [
              SizedBox(
                height: 8.h,
              ),
              AnimatedDotsIndicator(
                dotsCount: widget.adsItems.length,
                position: currentIndex,
                activeColor: widget.activeDotIndicatorColor,
                inActiveColor: widget.inActiveDotIndicatorColor,
                activeDuration: adsDuration,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
