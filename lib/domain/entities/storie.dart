import 'package:equatable/equatable.dart';

import './entities.dart';

class StorieEntity extends Equatable {
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

  @override
  List<Object?> get props => [
        uid,
        user,
        createdAt,
        updatedAt,
        deletedAt,
      ];
}
