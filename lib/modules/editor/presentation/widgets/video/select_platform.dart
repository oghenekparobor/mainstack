import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';

class SelectvideoPlatform extends StatefulWidget {
  const SelectvideoPlatform({super.key});

  @override
  State<SelectvideoPlatform> createState() => _SelectvideoPlatformState();
}

class _SelectvideoPlatformState extends State<SelectvideoPlatform> {
  var current = 0;

  List platform = [
    {
      'label': 'Youtube',
      'icon':
          'https://www.freepnglogos.com/uploads/youtube-play-red-logo-png-transparent-background-6.png',
    },
    {
      'label': 'Vimeo',
      'icon':
          'https://cdn.freebiesupply.com/logos/large/2x/vimeo-icon-blue-logo-png-transparent.png',
    },
    {
      'label': 'Twitch',
      'icon': 'https://cdn-icons-png.flaticon.com/512/5968/5968819.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      key: widget.key,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Select video platform',
          style: theme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const YSpacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 0; i < platform.length; i++)
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      current = i;
                    });
                  },
                  child: Container(
                    height: 80.h,
                    margin: EdgeInsets.only(
                      right: 4.w,
                      left: 4.w,
                    ),
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
              ),
          ],
        ),
        const YSpacer(value: 20),
      ],
    );
  }
}
