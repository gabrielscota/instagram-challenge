import './entities.dart';

class UserEntity {
  final String uid;
  final String email;
  final String username;
  final String avatar;
  final String name;
  final List<PostEntity> posts;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;

  const UserEntity({
    required this.uid,
    required this.email,
    required this.username,
    required this.avatar,
    required this.name,
    required this.posts,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });
}
