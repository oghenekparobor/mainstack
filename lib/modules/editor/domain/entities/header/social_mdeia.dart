import 'package:equatable/equatable.dart';

class SocialMediaEntity extends Equatable {
  const SocialMediaEntity({
    required this.id,
    required this.icon,
    required this.link,
    required this.name,
    required this.position,
  });

  final String id;
  final String link;
  final String icon;
  final String name;
  final int position;

  @override
  List<Object?> get props => [id, link, icon, name, position];
}
