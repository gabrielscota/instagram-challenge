import 'package:meta/meta.dart';

import './entities.dart';

class PostEntity {
  final UserEntity user;
  final String subtitle;
  final String imageUrl;
  var likes = <UserEntity>[];

  PostEntity({
    @required this.user,
    this.subtitle = '',
    @required this.imageUrl,
    @required this.likes,
  });
}
