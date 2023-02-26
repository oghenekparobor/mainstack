import 'package:equatable/equatable.dart';
import 'package:mainstack/core/util/element.dart';
import 'package:mainstack/modules/editor/data/model/pdf/pdf.dart';

class PdfElementEntity extends Equatable with EditorElements {
  const PdfElementEntity({
    required this.content,
    required this.hasHeader,
    required this.id,
    required this.pdfs,
  });

  final String id;
  final bool hasHeader;
  final String content;
  final List<PdfModel> pdfs;

  @override
  List<Object?> get props => [id, hasHeader, content, pdfs];
}
