import 'package:json_annotation/json_annotation.dart';
import 'package:mainstack/core/util/element.dart';
import 'package:mainstack/modules/editor/data/model/link/link.dart';
import 'package:mainstack/modules/editor/domain/entities/link/link_element.dart';

part 'link_element.g.dart';

@JsonSerializable()
class LinkElementModel extends LinkElementEntity with EditorElements {
  const LinkElementModel({
    required super.id,
    required super.links,
  });

  factory LinkElementModel.fromJson(Map<String, dynamic> json) =>
      _$LinkElementModelFromJson(json);

  Map<String, dynamic> toJson() => _$LinkElementModelToJson(this);
}
