import 'package:instagram_challenge/domain/entities/entities.dart';

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
      throw FirebaseError.invalidData;
    }
    return RemoteUserLikeModel(
      username: json['username'],
      avatar: json['avatar'],
      name: json['name'],
    );
  }

  UserLikeEntity toEntity() => UserLikeEntity(
        username: username,
        avatar: avatar,
        name: name,
      );
}
