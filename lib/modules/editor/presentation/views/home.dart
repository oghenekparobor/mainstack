import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/util/dialog.dart';
import 'package:mainstack/core/widgets/spacer/xspacer.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/modules/editor/presentation/views/add-element/add_element.dart';
import 'package:mainstack/modules/editor/presentation/views/audio/audio_element.dart';
import 'package:mainstack/modules/editor/presentation/views/header/header.dart';
import 'package:mainstack/modules/editor/presentation/views/image/image_element.dart';
import 'package:mainstack/modules/editor/presentation/views/link/link_element.dart';
import 'package:mainstack/modules/editor/presentation/views/pdf/pdf_element.dart';
import 'package:mainstack/modules/editor/presentation/views/text/text_element.dart';
import 'package:mainstack/modules/editor/presentation/views/video/video_element.dart';
import 'package:mainstack/modules/editor/presentation/widgets/editor_appbar.dart';

class EditorHome extends StatelessWidget {
  const EditorHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EditorAppBar(),
      floatingActionButton: ElasticIn(
        child: FloatingActionButton.extended(
          onPressed: null,
          backgroundColor: theme.primaryColor,
          label: Row(
            children: [
              IconButton(
                tooltip: 'Customize existing session',
                onPressed: () {},
                icon: const Icon(
                  Icons.palette,
                  color: Colors.white,
                ),
              ),
              const XSpacer(value: 20),
              IconButton(
                tooltip: 'Add new section',
                onPressed: () {
                  MyDialog().showDialog(const AddBlockElement());
                },
                icon: Spin(
                  delay: const Duration(milliseconds: 200),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: ReorderableListView(
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          onReorder: (oldIndex, newIndex) {},
          children: const [
            Header(key: ValueKey('editor_header')),
            LinkElement(key: ValueKey('link_element')),
            TextElement(key: ValueKey('text_element')),
            VideoElement(key: ValueKey('video_element')),
            AudioElement(key: ValueKey('audio_element')),
            PDFElement(key: ValueKey('pdf_element')),
            ImageElement(key: ValueKey('image_element')),
            YSpacer(value: 150, key: ValueKey('bottom_spacer')),
          ],
        ),
      ),
    );
  }
}
