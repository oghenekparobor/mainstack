import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/xspacer.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/element_service.dart';

class PdfUploadTile extends StatefulWidget {
  const PdfUploadTile({
    super.key,
    required this.id,
    this.file,
  });

  final String id;
  final String? file;

  @override
  State<PdfUploadTile> createState() => _PdfUploadTileState();
}

class _PdfUploadTileState extends State<PdfUploadTile> {
  String file = '';

  @override
  void initState() {
    file = widget.file ?? '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pick(),
      child: file.isEmpty
          ? Container(
              width: double.infinity,
              height: 200.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  width: .5.w,
                  color: Colors.grey.shade300,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.picture_as_pdf_outlined),
                  const YSpacer(),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Drop your files here, ',
                          style: theme.textTheme.titleSmall,
                        ),
                        TextSpan(
                          text: 'or click to browse',
                          style: theme.textTheme.titleSmall!.copyWith(
                            color: Colors.deepOrange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : SizedBox(
              height: 70.h,
              child: Row(
                children: [
                  Container(
                    width: 85.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: const Icon(Icons.picture_as_pdf_outlined),
                  ),
                  const XSpacer(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const YSpacer(value: 3),
                        Text(
                          file.split('/').last,
                          style: theme.textTheme.bodyMedium,
                        ),
                        const YSpacer(value: 3),
                        Text(
                          '${(File(file).lengthSync() / 1024).round()} KB',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: Colors.grey.shade500,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  pick() async {
    FilePicker.platform.pickFiles(
      allowCompression: true,
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'rtf', 'docx', 'doc'],
    ).then(
      (value) {
        if (value != null) {
          setState(() {
            file = value.files.first.path!;
          });
          es.updatePdf('file', value.files.first.path, widget.id);
        }
      },
    );
  }
}
