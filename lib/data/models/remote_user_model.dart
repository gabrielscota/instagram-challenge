import '../../domain/entities/entities.dart';
import '../firebase/firebase.dart';
import './models.dart';

class RemoteUserModel {
  final String uid;
  final String email;
  final String username;
  final String avatar;
  final String name;
  final List<RemotePostModel> posts;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;

  const RemoteUserModel({
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

  factory RemoteUserModel.fromJson(Map json) {
    if (!json.containsKey('uid')) {
      throw FirebaseFirestoreError.invalidData;
    }
    return RemoteUserModel(
      uid: json['uid'],
      email: json['email'],
      username: json['username'],
      avatar: json['avatar'],
      name: json['name'],
      posts: [],
      createdAt: json['createdAt'] != null ? json['createdAt'] : '',
      updatedAt: json['updatedAt'] != null ? json['updatedAt'] : '',
      deletedAt: json['deletedAt'] != null ? json['deletedAt'] : '',
    );
  }

  factory RemoteUserModel.fromEntity(UserEntity entity) {
    return RemoteUserModel(
      uid: entity.uid,
      email: entity.email,
      username: entity.username,
      avatar: entity.avatar,
      name: entity.name,
      posts: entity.posts.map((post) => RemotePostModel.fromEntity(post)).toList(),
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
    );
  }

  UserEntity toEntity() => UserEntity(
        uid: uid,
        email: email,
        username: username,
        avatar: avatar,
        name: name,
        posts: posts.map<PostEntity>((post) => post.toEntity()).toList(),
        createdAt: createdAt,
        updatedAt: updatedAt,
        deletedAt: deletedAt,
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'username': username,
        'avatar': avatar,
        'name': name,
        'posts': posts,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deletedAt': deletedAt,
      };
}
