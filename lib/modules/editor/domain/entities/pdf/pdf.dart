import 'package:equatable/equatable.dart';

class PdfEntity extends Equatable {
  const PdfEntity({
    required this.file,
    required this.id,
    required this.position,
    required this.title,
  });

  final String id;
  final int position;
  final String title;
  final String file;

  @override
  List<Object?> get props => [id, position, title, file];
}
