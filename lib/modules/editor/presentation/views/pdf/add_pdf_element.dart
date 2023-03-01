import 'package:flutter/material.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/config/route/route.dart';
import 'package:mainstack/core/util/toast.dart';
import 'package:mainstack/core/widgets/button/outline_button.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/core/widgets/textfield/textfield.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/element_service.dart';
import 'package:mainstack/modules/editor/presentation/widgets/add_sub_element.dart';
import 'package:mainstack/modules/editor/presentation/widgets/add_template.dart';
import 'package:mainstack/modules/editor/presentation/widgets/not_draggable.dart';
import 'package:mainstack/modules/editor/presentation/widgets/pdf/add_header.dart';
import 'package:mainstack/modules/editor/presentation/widgets/pdf/upload_tile.dart';
import 'package:provider/provider.dart';

class AddPdfElement extends StatelessWidget {
  const AddPdfElement({
    super.key,
    this.id,
  });

  final String? id;

  @override
  Widget build(BuildContext context) {
    return AddTemplate(
      label: 'Add Pdf',
      child: Consumer<ElementNotifer>(
        builder: (_, value, __) => ReorderableListView(
          children: [
            const NotDraggable(
              key: ValueKey('add_pdf_header'),
              child: AddPdfHeader(),
            ),
            for (var i in value.pdfs)
              SubMovableElementTemplate(
                key: ValueKey('add_pdf_tile_1_${i.id}'),
                label: 'Pdf',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyTextField(
                      defaultValue: i.title,
                      title: 'Title',
                      labelSize: 14,
                      focusNode: FocusNode(),
                      onChanged: (p0) => es.updatePdf('title', p0, i.id),
                    ),
                    const YSpacer(value: 20),
                    PdfUploadTile(id: i.id, file: i.file)
                  ],
                ),
                onDelete: () => es.removePdfField(i.id),
              ),
            MyOutlineButton(
              key: const ValueKey('add_more_pdf'),
              label: 'Add More',
              icon: const Icon(Icons.add, size: 18),
              onTap: () => es.addPdf(),
            ),
          ],
          onReorder: (oldIndex, newIndex) => es.rearrangePdfs(
            oldIndex: oldIndex,
            newIndex: newIndex,
            lenthOfWidgets: es.pdfs.length,
            top: 1,
            bottom: 1,
          ),
        ),
      ),
      onTap: () => save(),
    );
  }

  save() {
    if (es.validatePdf()) {
      es.addPdfToElements(id);

      nav.popUntil(ModalRoute.withName(Routes.editor));

      MyToast().show('Element added successfully', error: false);
    }
  }
}
