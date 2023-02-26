import 'package:equatable/equatable.dart';

class LinkEntity extends Equatable {
  const LinkEntity({
    required this.id,
    required this.link,
    required this.position,
    required this.title,
  });

  final String id;
  final int position;
  final String title;
  final String link;

  @override
  List<Object?> get props => [
        id,
        position,
        link,
        title,
      ];
}
