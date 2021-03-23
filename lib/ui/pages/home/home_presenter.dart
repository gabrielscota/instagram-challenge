import '../pages.dart';

abstract class HomePresenter {
  Stream<UserViewModel?> get userStream;
  Stream<String?> get navigateToStream;

  Future<void> loadPostsData(String userUID);
  Future<void> logout();
}
