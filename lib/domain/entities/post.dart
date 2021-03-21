import 'package:equatable/equatable.dart';

import './entities.dart';

class PostEntity extends Equatable {
  final String uid;
  final UserEntity user;
  final String subtitle;
  final String imageUrl;
  final String description;
  final List<UserLikeEntity> likes;
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

  @override
  List<Object?> get props => [
        uid,
        user,
        subtitle,
        imageUrl,
        description,
        likes,
        createdAt,
        updatedAt,
        deletedAt,
      ];
}
