import '../pages.dart';

abstract class HomePresenter {
  Stream<UserViewModel?> get userStream;

  Future<void> loadPostsData(String userUID);
}
