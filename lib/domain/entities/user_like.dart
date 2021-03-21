import 'package:equatable/equatable.dart';

class UserLikeEntity extends Equatable {
  final String username;
  final String avatar;
  final String name;

  const UserLikeEntity({
    required this.username,
    required this.avatar,
    required this.name,
  });

  @override
  List<Object?> get props => [
        username,
        avatar,
        name,
      ];
}
