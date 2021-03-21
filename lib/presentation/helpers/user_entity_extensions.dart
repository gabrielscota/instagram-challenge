import '../../domain/entities/entities.dart';
import '../../ui/pages/pages.dart';

extension UserEntityExtensions on UserEntity {
  UserViewModel toViewModel() => UserViewModel(
        uid: uid,
        username: username,
        avatar: avatar,
        name: name,
      );
}
