import './entities.dart';

class StorieEntity {
  final String uid;
  final UserEntity user;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;

  const StorieEntity({
    required this.uid,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });
}
