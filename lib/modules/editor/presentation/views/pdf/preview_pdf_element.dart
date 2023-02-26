import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/modules/editor/data/model/pdf/pdf_element.dart';

class PreviewPdfElement extends StatelessWidget {
  const PreviewPdfElement({
    super.key,
    required this.pem,
  });

  final PdfElementModel pem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (pem.hasHeader)
          Text(
            pem.content,
            style: theme.textTheme.displayMedium,
          ),
        const YSpacer(value: 20),
        for (var i in pem.pdfs)
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 8.h),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    i.title,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              trailing: const Icon(
                Icons.picture_as_pdf_outlined,
                color: Colors.white,
                size: 18,
              ),
            ),
          )
      ],
    );
  }
}
