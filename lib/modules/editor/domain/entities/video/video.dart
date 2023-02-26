import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  const VideoEntity({
    required this.id,
    required this.link,
    required this.position,
  });

  final String id;
  final int position;
  final String link;

  @override
  List<Object?> get props => [id, position, link];
}
