import 'package:meta/meta.dart';

class UserEntity {
  final String id;
  final String username;
  final String userPhoto;
  final String name;

  const UserEntity({
    @required this.id,
    @required this.username,
    @required this.userPhoto,
    @required this.name,
  });
}
