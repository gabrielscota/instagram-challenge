import './entities.dart';

class PostEntity {
  final String uid;
  final UserEntity user;
  final String subtitle;
  final String imageUrl;
  final String description;
  var likes = <UserLikeEntity>[];
  final String createdAt;
  final String updatedAt;
  final String deletedAt;

  PostEntity({
    required this.uid,
    required this.user,
    required this.subtitle,
    required this.imageUrl,
    required this.description,
    required this.likes,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });
}
