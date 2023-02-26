import 'package:equatable/equatable.dart';
import 'package:mainstack/modules/editor/data/model/text/text.dart';

class TextElementEntity extends Equatable {
  const TextElementEntity({
    required this.id,
    required this.text,
  });

  final String id;
  final TextModel text;

  @override
  List<Object?> get props => [id, text];
}
