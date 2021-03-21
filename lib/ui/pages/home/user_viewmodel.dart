import 'package:equatable/equatable.dart';

class UserViewModel extends Equatable {
  final String uid;
  final String username;
  final String avatar;
  final String name;

  const UserViewModel({
    required this.uid,
    required this.username,
    required this.avatar,
    required this.name,
  });

  @override
  List<Object?> get props => [uid, username, avatar, name];
}
