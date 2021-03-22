import 'package:instagram_challenge/domain/entities/entities.dart';

import '../firebase/firebase.dart';
import './models.dart';

class RemotePostModel {
  final String uid;
  final RemoteUserModel user;
  final String subtitle;
  final String imageUrl;
  final String description;
  var likes = <RemoteUserLikeModel>[];
  final String createdAt;
  final String updatedAt;
  final String deletedAt;

  RemotePostModel({
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

  factory RemotePostModel.fromJson(Map json) {
    if (!json.containsKey('uid')) {
      throw FirebaseFirestoreError.invalidData;
    }
    return RemotePostModel(
      uid: json['uid'],
      user: RemoteUserModel.fromJson(json['user']),
      subtitle: json['subtitle'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      likes: [],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
    );
  }

  factory RemotePostModel.fromJsonWithUser(Map json, RemoteUserModel user) {
    if (!json.containsKey('uid')) {
      throw FirebaseFirestoreError.invalidData;
    }
    return RemotePostModel(
      uid: json['uid'],
      user: user,
      subtitle: json['subtitle'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      likes: [],
      createdAt: json['createdAt'] != null ? json['createdAt'] : '',
      updatedAt: json['updatedAt'] != null ? json['updatedAt'] : '',
      deletedAt: json['deletedAt'] != null ? json['deletedAt'] : '',
    );
  }

  PostEntity toEntity() => PostEntity(
        uid: uid,
        user: user.toEntity(),
        subtitle: subtitle,
        imageUrl: imageUrl,
        description: description,
        likes: likes.map((like) => like.toEntity()).toList(),
        createdAt: createdAt,
        updatedAt: updatedAt,
        deletedAt: deletedAt,
      );
}
