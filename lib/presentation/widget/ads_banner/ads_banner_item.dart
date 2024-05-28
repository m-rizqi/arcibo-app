import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class AdsBannerItem extends StatelessWidget {
  const AdsBannerItem({
    super.key,
    required this.adsBannerModel,
  });

  final dynamic adsBannerModel;

  //#region FUNCTION
  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
  //#endregion FUNCTION

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: (){
          // _launchUrl(adsBannerModel.url ?? 'https://');
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: InteractiveViewer(
            child: Image.network(
              'https://kreativitas.ugm.ac.id/wp-content/uploads/sites/1408/2021/05/S__76537859-411x510.jpg',
              fit: BoxFit.cover,
              // errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
              //   return const ImageErrorWidget();
              // },
            ),
          ),
        ),
      ),
    );
  }
}