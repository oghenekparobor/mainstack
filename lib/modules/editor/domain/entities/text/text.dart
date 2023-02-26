import 'package:equatable/equatable.dart';

class TextEntity extends Equatable {
  const TextEntity({
    required this.body,
    required this.header,
    required this.id,
  });

  final String id;
  final String header;
  final String body;

  @override
  List<Object?> get props => [id, header, body];
}
