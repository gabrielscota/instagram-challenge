import '../entities/entities.dart';

abstract class LoadUserSelf {
  Future<UserEntity> load(String userUID);
}
