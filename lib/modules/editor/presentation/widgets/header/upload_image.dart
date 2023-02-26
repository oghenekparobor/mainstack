import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:images_picker/images_picker.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/image/profile_img.dart';
import 'package:mainstack/core/widgets/spacer/xspacer.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/header_service.dart';
import 'package:mainstack/modules/editor/presentation/widgets/header/icon_button.dart';
import 'package:provider/provider.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  String file = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Consumer<HeaderNotifer>(
              builder: (_, value, __) => GestureDetector(
                onTap: () => pickImage('bannerImage'),
                child: Container(
                  width: double.infinity,
                  height: 200.h,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(242, 242, 247, 1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: (file.isEmpty)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const MyIcon(icon: Icons.image_outlined),
                            const YSpacer(),
                            Text(
                              'Upload your Image',
                              style: theme.textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Minimum width 480px, 16:9 recommeded\n(Image should not exceed 5MB)',
                              style: theme.textTheme.titleSmall,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: SizedBox(
                            width: double.infinity,
                            height: 200.h,
                            child: Stack(
                              children: [
                                Image.file(
                                  File(file),
                                  width: double.infinity,
                                  height: 200.h,
                                  fit: BoxFit.cover,
                                ),
                                Align(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () => pickImage('bannerImage'),
                                        child: const MyIcon(
                                          icon: Icons.camera_alt,
                                        ),
                                      ),
                                      const XSpacer(value: 20),
                                      GestureDetector(
                                        child: const MyIcon(
                                          icon: Icons.delete_outline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: 100.w,
                height: 100.h,
                child: Stack(
                  children: [
                    const MyProfileImage(radius: 50),
                    Align(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            child: const MyIcon(icon: Icons.camera_alt),
                          ),
                          GestureDetector(
                            child: const MyIcon(icon: Icons.delete_outline),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void pickImage(key) {
    ImagesPicker.pick(
      count: 1,
      maxSize: 1024,
      pickType: PickType.image,
      quality: .6,
    ).then((value) {
      if (value != null) {
        setState(() {
          file = value.first.path;
        });

        hn.banner = value.first.path;
      }
    });
  }
}
