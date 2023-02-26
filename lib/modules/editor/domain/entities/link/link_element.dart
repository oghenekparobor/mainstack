import 'package:equatable/equatable.dart';
import 'package:mainstack/core/util/element.dart';
import 'package:mainstack/modules/editor/data/model/link/link.dart';

class LinkElementEntity extends Equatable with EditorElements {
  const LinkElementEntity({
    required this.id,
    required this.links,
  });

  final String id;
  final List<LinkModel> links;

  @override
  List<Object?> get props => [id, links];
}
