import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';

class SelectAudioPlatform extends StatefulWidget {
  const SelectAudioPlatform({super.key});

  @override
  State<SelectAudioPlatform> createState() => _SelectAudioPlatformState();
}

class _SelectAudioPlatformState extends State<SelectAudioPlatform> {
  var current = 0;

  List platform = [
    {
      'label': 'Spotify',
      'icon':
          'https://www.freepnglogos.com/uploads/spotify-logo-png/spotify-icon-green-logo-8.png',
    },
    {
      'label': 'Soundcloud',
      'icon':
          'https://www.freepnglogos.com/uploads/soundcloud-logo-png/soundcloud-logo-soundcloud-saved-cash-infusion-kerry-trainor-becomes-ceo-deadline-7.png',
    },
    {
      'label': 'Apple Music',
      'icon':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Apple_Music_icon.svg/2048px-Apple_Music_icon.svg.png',
    },
    {
      'label': 'Youtube Music',
      'icon':
          'https://static.vecteezy.com/system/resources/previews/017/396/813/non_2x/youtube-music-icon-free-png.png',
    },
    {
      'label': 'Tidal',
      'icon':
          'https://www.pngitem.com/pimgs/m/133-1336160_tidal-icon-listen-on-tidal-logo-hd-png.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      key: widget.key,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Select audio platform',
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
