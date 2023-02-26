import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_summernote/flutter_summernote.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/core/widgets/textfield/textfield.dart';
import 'package:mainstack/modules/editor/presentation/widgets/add_template.dart';

class AddTextElement extends StatefulWidget {
  const AddTextElement({super.key});

  @override
  State<AddTextElement> createState() => _AddTextElementState();
}

class _AddTextElementState extends State<AddTextElement> {
  final GlobalKey<FlutterSummernoteState> _keyEditor = GlobalKey();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AddTemplate(
      label: 'Add Text',
      child: ListView(
        children: [
          const YSpacer(value: 20),
          MyTextField(
            title: 'Header',
            labelSize: 20,
            focusNode: FocusNode(),
          ),
          const YSpacer(value: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                  width: .5.w,
                  color: Colors.grey.shade300,
                ),
              ),
              child: FlutterSummernote(
                hint: "",
                key: _keyEditor,
                height: 300.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(
                    width: .5.w,
                    color: Colors.grey.shade300,
                  ),
                ),
                customToolbar: """
                        [
                          ['style', ['bold', 'italic', 'underline', 'clear']],
                          ['font', ['strikethrough', 'superscript', 'subscript']]
                        ]
                      """,
                showBottomToolbar: false,
              ),
            ),
          ),
        ],
      ),
      onTap: () => nav.pop(),
    );
  }
}
