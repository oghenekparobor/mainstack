import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/modules/editor/data/model/link/link.dart';

class PreviewLinkElement extends StatelessWidget {
  const PreviewLinkElement({
    super.key,
    required this.lm,
  });

  final List<LinkModel> lm;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i in lm)
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 8.h),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: ListTile(
              title: Text(
                i.title,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
              ),
              trailing: const Icon(Icons.call_made, color: Colors.white),
            ),
          ),
      ],
    );
  }
}
