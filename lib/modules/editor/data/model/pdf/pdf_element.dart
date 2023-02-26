import 'package:json_annotation/json_annotation.dart';
import 'package:mainstack/core/util/element.dart';
import 'package:mainstack/modules/editor/data/model/pdf/pdf.dart';
import 'package:mainstack/modules/editor/domain/entities/pdf/pdf_element.dart';

part 'pdf_element.g.dart';

@JsonSerializable()
class PdfElementModel extends PdfElementEntity {
  const PdfElementModel({
    required super.content,
    required super.hasHeader,
    required super.id,
    required super.pdfs,
  });

  factory PdfElementModel.fromJson(Map<String, dynamic> json) =>
      _$PdfElementModelFromJson(json);

  Map<String, dynamic> toJson() => _$PdfElementModelToJson(this);
}
