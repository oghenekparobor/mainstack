import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/modules/editor/data/model/image/image.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({
    super.key,
    required this.width,
    required this.im,
  });

  final double width;
  final ImageModel im;

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
              child: Image.file(
                File(im.image),
                height: 200.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                im.caption ?? '',
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
