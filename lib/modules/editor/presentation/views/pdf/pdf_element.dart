import 'package:flutter/widgets.dart';
import 'package:mainstack/core/util/dialog.dart';
import 'package:mainstack/modules/editor/data/model/pdf/pdf_element.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/element_service.dart';
import 'package:mainstack/modules/editor/presentation/views/pdf/add_pdf_element.dart';
import 'package:mainstack/modules/editor/presentation/views/pdf/preview_pdf_element.dart';
import 'package:mainstack/modules/editor/presentation/widgets/element_template.dart';

class PDFElement extends StatelessWidget {
  const PDFElement({
    super.key,
    required this.pem,
  });

  final PdfElementModel pem;

  @override
  Widget build(BuildContext context) {
    return ElementTemplate(
      label: 'Pdf',
      child: PreviewPdfElement(pem: pem),
      delete: () => es.removeElement(pem.id),
      duplicate: () => es.duplicatePdf(pem),
      edit: () {
        es.editPdf(pem.pdfs);
        MyDialog().showDialog(AddPdfElement(id: pem.id));
      },
    );
  }
}
