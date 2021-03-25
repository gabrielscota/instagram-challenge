import '../../domain/entities/entities.dart';
import '../firebase/firebase.dart';

class RemoteUserLikeModel {
  final String username;
  final String avatar;
  final String name;

  const RemoteUserLikeModel({
    required this.username,
    required this.avatar,
    required this.name,
  });

  factory RemoteUserLikeModel.fromJson(Map json) {
    if (!json.containsKey('username')) {
      throw FirebaseFirestoreError.invalidData;
    }
    return RemoteUserLikeModel(
      username: json['username'],
      avatar: json['avatar'],
      name: json['name'],
    );
  }

  factory RemoteUserLikeModel.fromEntity(UserLikeEntity entity) {
    return RemoteUserLikeModel(
      username: entity.username,
      avatar: entity.avatar,
      name: entity.name,
    );
  }

  UserLikeEntity toEntity() => UserLikeEntity(
        username: username,
        avatar: avatar,
        name: name,
      );
}
