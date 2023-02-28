import 'package:flutter/material.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/config/route/route.dart';
import 'package:mainstack/core/util/toast.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/core/widgets/textfield/textfield.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/element_service.dart';
import 'package:mainstack/modules/editor/presentation/widgets/add_template.dart';

class AddTextElement extends StatefulWidget {
  const AddTextElement({
    super.key,
    this.id,
  });

  final String? id;

  @override
  State<AddTextElement> createState() => _AddTextElementState();
}

class _AddTextElementState extends State<AddTextElement> {
  // final GlobalKey<FlutterSummernoteState> _keyEditor = GlobalKey();
  // late TextEditingController controller;
  // String data = '';

  @override
  void initState() {
    // controller = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // controller.dispose();

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
            controller: TextEditingController(text: es.text.header),
            title: 'Header',
            labelSize: 20,
            focusNode: FocusNode(),
            onChanged: (p0) => es.updateTextProps('header', p0),
          ),
          // const YSpacer(value: 20),
          MyTextField(
            controller: TextEditingController(text: es.text.body),
            title: '',
            labelSize: 20,
            maxline: 6,
            focusNode: FocusNode(),
            onChanged: (p0) => es.updateTextProps('body', p0),
          ),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(15.r),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(15.r),
          //       border: Border.all(
          //         width: .5.w,
          //         color: Colors.grey.shade300,
          //       ),
          //     ),
          //     child: FlutterSummernote(
          //       hint: "",
          //       key: _keyEditor,
          //       height: 300.h,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(15.r),
          //         border: Border.all(
          //           width: .5.w,
          //           color: Colors.grey.shade300,
          //         ),
          //       ),
          //       customToolbar: """
          //               [
          //                 ['style', ['bold', 'italic', 'underline', 'clear']],
          //                 ['font', ['strikethrough', 'superscript', 'subscript']]
          //               ]
          //             """,
          //       showBottomToolbar: false,
          //     ),
          //   ),
          // ),
          const YSpacer(),
        ],
      ),
      onTap: () async => await save(),
    );
  }

  save() {
    if (es.validateText()) {
      es.addTextToElements(widget.id);

      nav.popUntil(ModalRoute.withName(Routes.editor));
      MyToast().show('Element added successfully', error: false);
    }
    // var body = await _keyEditor.currentState!.getText();

    // print(body);

    // if (body.isNotEmpty) {
    // _keyEditor.currentState!.getText().then((value) {

    // });
    // } else {
    //   print('here ran');
    //   MyToast().show('Please ensure to fill all fields');
    // }
  }
}
