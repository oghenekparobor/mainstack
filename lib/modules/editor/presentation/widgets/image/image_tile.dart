import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 200.h,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200.h,
            margin: EdgeInsets.only(bottom: 8.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: FancyShimmerImage(
                imageUrl:
                    'https://qxtravel.org/wp-content/uploads/2020/07/cappadocia-paragliding-price-1.jpg',
                height: 200.h,
                width: double.infinity,
                boxFit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Caption',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
