import 'package:equatable/equatable.dart';
import 'package:mainstack/modules/editor/data/model/header/social-media/social_media.dart';

class HeaderEntity extends Equatable {
  const HeaderEntity({
    required this.applicableTitle,
    required this.bannerImage,
    required this.bio,
    required this.displayName,
    required this.displayPicture,
    required this.id,
    required this.socialMedia,
  });

  final String id;
  final String? bannerImage;
  final String displayPicture;
  final String displayName;
  final String bio;
  final List applicableTitle;
  final List<SocialMediaModel> socialMedia;

  @override
  List<Object?> get props => [
        id,
        bannerImage,
        displayName,
        displayPicture,
        bio,
        applicableTitle,
        socialMedia,
      ];
}
