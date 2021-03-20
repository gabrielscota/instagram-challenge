import './models.dart';

class RemotePostModel {
  final String id;
  final RemoteUserModel user;
  final String subtitle;
  final String imageUrl;
  var likes = <RemoteUserModel>[];

  RemotePostModel({
    required this.id,
    required this.user,
    this.subtitle = '',
    required this.imageUrl,
    required this.likes,
  });
}
