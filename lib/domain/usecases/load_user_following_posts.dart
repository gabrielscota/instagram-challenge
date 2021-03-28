import '../entities/entities.dart';

abstract class LoadUserFollowingPosts {
  Future<List<PostEntity>> loadUserFollowingPosts(String userUID);
}
