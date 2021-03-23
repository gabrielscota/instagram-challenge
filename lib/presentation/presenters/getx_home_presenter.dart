import 'package:get/get.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../../ui/pages/pages.dart';
import '../mixins/mixins.dart';

class GetxHomePresenter extends GetxController with NavigationManager implements HomePresenter {
  final LoadPosts loadPosts;
  final LoadUserSelf loadUserSelf;
  final DeleteCurrentUser deleteCurrentUser;
  final UserLogout userLogout;

  GetxHomePresenter({
    required this.loadPosts,
    required this.loadUserSelf,
    required this.deleteCurrentUser,
    required this.userLogout,
  });

  final _user = Rx<UserViewModel?>();
  Stream<UserViewModel?> get userStream => _user.stream;

  @override
  Future<void> loadPostsData(String userUID) async {
    try {
      final UserEntity user = await loadUserSelf.load(userUID);
      _user.subject.add(
        UserViewModel(
          uid: user.uid,
          username: user.username,
          avatar: user.avatar,
          name: user.name,
        ),
      );
    } catch (_) {}
  }

  @override
  Future<void> logout() async {
    await userLogout.logout();
    await deleteCurrentUser.delete(key: 'uid');
    navigateTo = '/login';
  }
}
