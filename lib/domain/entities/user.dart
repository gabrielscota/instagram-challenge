import 'package:equatable/equatable.dart';

import './entities.dart';

class UserEntity extends Equatable {
  final String uid;
  final String email;
  final String username;
  final String avatar;
  final String name;
  final List<PostEntity> posts;
  final List<String> followers;
  final List<String> following;
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
    required this.followers,
    required this.following,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  @override
  List<Object?> get props => [
        uid,
        email,
        username,
        avatar,
        name,
        posts,
        createdAt,
        updatedAt,
        deletedAt,
      ];
}
