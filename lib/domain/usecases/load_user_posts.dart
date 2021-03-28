import '../entities/entities.dart';

abstract class LoadUserPosts {
  Future<List<PostEntity>> loadUserPosts(String userUID);
}
