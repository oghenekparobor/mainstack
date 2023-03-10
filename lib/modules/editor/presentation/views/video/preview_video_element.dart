import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/modules/editor/data/model/video/video_element.dart';

class PreviewVideoElement extends StatelessWidget {
  const PreviewVideoElement({
    super.key,
    required this.vem,
  });

  final VideoElementModel vem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (vem.hasHeader)
          Text(
            vem.title,
            style: theme.textTheme.displayMedium,
          ),
        if (vem.hasHeader) const YSpacer(value: 30),
        for (var i in vem.videos)
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: SizedBox(
              width: double.infinity,
              height: 200.h,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: FancyShimmerImage(
                      boxDecoration: BoxDecoration(
                        color: Colors.red.shade300,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      boxFit: BoxFit.cover,
                      width: double.infinity,
                      height: 200.h,
                      imageUrl: i.link,
                    ),
                  ),
                  Align(
                    child: Container(
                      width: 70.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.play_arrow,
                        size: 32.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
