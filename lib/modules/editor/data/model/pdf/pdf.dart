import 'package:json_annotation/json_annotation.dart';
import 'package:mainstack/core/util/element.dart';
import 'package:mainstack/modules/editor/domain/entities/pdf/pdf.dart';

part 'pdf.g.dart';

@JsonSerializable()
class PdfModel extends PdfEntity {
  const PdfModel({
    required super.file,
    required super.id,
    required super.position,
    required super.title,
  });

  factory PdfModel.fromJson(Map<String, dynamic> json) =>
      _$PdfModelFromJson(json);

  Map<String, dynamic> toJson() => _$PdfModelToJson(this);
}
