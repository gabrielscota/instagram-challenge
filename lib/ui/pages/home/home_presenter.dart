import '../pages.dart';

abstract class HomePresenter {
  Stream<UserViewModel?> get userStream;
  Stream<List<PostViewModel>?> get postsStream;
  Stream<String?> get navigateToStream;

  Future<void> loadUser(String userUID);
  Future<void> loadUserFollowingPosts(String userUID);
  Future<void> logout();
}
