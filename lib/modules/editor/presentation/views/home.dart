import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/util/dialog.dart';
import 'package:mainstack/core/widgets/spacer/xspacer.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/element_service.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/header_service.dart';
import 'package:mainstack/modules/editor/presentation/views/add-element/add_element.dart';
import 'package:mainstack/modules/editor/presentation/views/header/header.dart';
import 'package:mainstack/modules/editor/presentation/widgets/editor_appbar.dart';
import 'package:provider/provider.dart';

class EditorHome extends StatefulWidget {
  const EditorHome({super.key});

  @override
  State<EditorHome> createState() => _EditorHomeState();
}

class _EditorHomeState extends State<EditorHome> {
  @override
  void initState() {
    Future.delayed(Duration.zero, _init);

    super.initState();
  }

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
        child: Consumer<ElementNotifer>(
          builder: (_, value, __) => ReorderableListView(
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            onReorder: (oldIndex, newIndex) {},
            children: [
              const Header(key: ValueKey('editor_header')),
              for (var i = 0; i < value.elements.length; i++)
                value.showElement(value.elements[i]),
              const YSpacer(value: 150, key: ValueKey('bottom_spacer')),
            ],
          ),
        ),
      ),
    );
  }

  void _init() => hn.prePopulateHeader();
}
