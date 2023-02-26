import 'package:flutter/widgets.dart';
import 'package:mainstack/modules/editor/data/model/pdf/pdf_element.dart';
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
    );
  }
}
