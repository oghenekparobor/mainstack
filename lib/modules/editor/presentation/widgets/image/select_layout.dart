import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';

class SelectImageLayout extends StatefulWidget {
  const SelectImageLayout({super.key});

  @override
  State<SelectImageLayout> createState() => _SelectImageLayoutState();
}

class _SelectImageLayoutState extends State<SelectImageLayout> {
  var current = 0;

  List platform = [
    {
      'label': 'Single',
      'icon':
          'https://customercare.igloosoftware.com/.api2/api/v1/communities/10068556/previews/thumbnails/4fc20722-5368-e911-80d5-b82a72db46f2?width=680&height=680&crop=False',
    },
    {
      'label': 'Grid',
      'icon':
          'https://w7.pngwing.com/pngs/648/914/png-transparent-computer-icons-new-york-city-grid-view-%E5%92%96%E5%95%A1%E6%B5%B7%E6%8A%A5%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90-miscellaneous-text-rectangle-thumbnail.png',
    },
    {
      'label': 'Carousel',
      'icon':
          'https://www.pngkey.com/png/detail/224-2247480_carousel-photos-comments-carousel-icon-png.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      key: widget.key,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Select layout style',
          style: theme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const YSpacer(),
        Wrap(
          children: [
            for (var i = 0; i < platform.length; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    current = i;
                  });
                },
                child: Container(
                  height: 80.h,
                  width: size.width * .24.w,
                  margin: EdgeInsets.only(right: 4.w, left: 4.w, bottom: 8.w),
                  decoration: BoxDecoration(
                    color: i == current ? Colors.red.shade50 : null,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      width: .5.w,
                      color: i == current
                          ? Colors.redAccent
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FancyShimmerImage(
                        imageUrl: platform[i]['icon'],
                        width: 24.w,
                        height: 24.h,
                        boxFit: BoxFit.contain,
                      ),
                      const YSpacer(value: 2),
                      Text(
                        platform[i]['label'],
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        const YSpacer(value: 20),
      ],
    );
  }
}
