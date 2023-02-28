import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/element_service.dart';
import 'package:provider/provider.dart';

class SelectvideoPlatform extends StatefulWidget {
  const SelectvideoPlatform({super.key});

  @override
  State<SelectvideoPlatform> createState() => _SelectvideoPlatformState();
}

class _SelectvideoPlatformState extends State<SelectvideoPlatform> {
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
        Consumer<ElementNotifer>(
          builder: (_, value, __) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var i = 0; i < value.vplatform.length; i++)
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        value.videoPlatformSelected = i;
                      });

                      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                      es.notifyListeners();
                    },
                    child: Container(
                      height: 80.h,
                      margin: EdgeInsets.only(right: 4.w, left: 4.w),
                      decoration: BoxDecoration(
                        color: i == value.videoPlatformSelected
                            ? Colors.red.shade50
                            : null,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          width: .5.w,
                          color: i == value.videoPlatformSelected
                              ? Colors.redAccent
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FancyShimmerImage(
                            imageUrl: es.vplatform[i]['icon'],
                            width: 24.w,
                            height: 24.h,
                            boxFit: BoxFit.contain,
                          ),
                          const YSpacer(value: 2),
                          Text(
                            es.vplatform[i]['label'],
                            style: theme.textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const YSpacer(value: 20),
      ],
    );
  }
}
