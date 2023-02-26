import 'package:equatable/equatable.dart';

class SocialMediaEntity extends Equatable {
  const SocialMediaEntity({
    required this.id,
    required this.icon,
    required this.link,
  });

  final String id;
  final String link;
  final String icon;

  @override
  List<Object?> get props => [id, link, icon];
}
