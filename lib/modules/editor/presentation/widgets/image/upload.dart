import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:images_picker/images_picker.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/element_service.dart';

class UploadTile extends StatefulWidget {
  const UploadTile({
    super.key,
    this.k = 'image',
    required this.id,
    this.file,
  });

  final String k;
  final String id;
  final String? file;

  @override
  State<UploadTile> createState() => _UploadTileState();
}

class _UploadTileState extends State<UploadTile> {
  String image = '';

  @override
  void initState() {
    image = widget.file ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(image);

    return GestureDetector(
      onTap: () => pickImage(),
      child: Container(
        width: double.infinity,
        height: 200.h,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(242, 242, 247, 1),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: image.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: 4.w,
                      bottom: 4.h,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.primaryColor,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Icon(Icons.image, size: 13.sp),
                  ),
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
                borderRadius: BorderRadius.circular(10.r),
                child: Image.file(
                  File(image),
                  width: double.infinity,
                  height: 200.h,
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }

  pickImage() {
    ImagesPicker.pick(
      count: 1,
      gif: true,
      quality: .5,
    ).then((value) {
      if (value != null) {
        setState(() {
          image = value.first.path;
        });

        es.updateImage(
          widget.k,
          value.first.path,
          widget.id,
        );

        // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
        es.notifyListeners();
      }
    });
  }
}
