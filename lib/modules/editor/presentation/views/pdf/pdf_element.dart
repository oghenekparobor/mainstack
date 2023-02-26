import 'package:flutter/widgets.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/modules/editor/presentation/views/pdf/preview_pdf_element.dart';
import 'package:mainstack/modules/editor/presentation/widgets/element_template.dart';

class PDFElement extends StatelessWidget {
  const PDFElement({super.key});

  @override
  Widget build(BuildContext context) {
    return ElementTemplate(
      label: 'Pdf',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Header',
            style: theme.textTheme.displayMedium,
          ),
          const YSpacer(value: 20),
          for (var i = 0; i < 2; i++) const PreviewPdfElement(),
        ],
      ),
    );
  }
}
