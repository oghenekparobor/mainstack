import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/element_service.dart';

class SelectImageLayout extends StatefulWidget {
  const SelectImageLayout({super.key});

  @override
  State<SelectImageLayout> createState() => _SelectImageLayoutState();
}

class _SelectImageLayoutState extends State<SelectImageLayout> {
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
            for (var i = 0; i < es.imgLayouts.length; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    es.selectedLayout = i;
                  });
                },
                child: Container(
                  height: 80.h,
                  width: size.width * .24.w,
                  margin: EdgeInsets.only(right: 4.w, left: 4.w, bottom: 8.w),
                  decoration: BoxDecoration(
                    color: i == es.selectedLayout ? Colors.red.shade50 : null,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      width: .5.w,
                      color: i == es.selectedLayout
                          ? Colors.redAccent
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FancyShimmerImage(
                        imageUrl: es.imgLayouts[i]['icon'],
                        width: 24.w,
                        height: 24.h,
                        boxFit: BoxFit.contain,
                      ),
                      const YSpacer(value: 2),
                      Text(
                        es.imgLayouts[i]['label'],
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
