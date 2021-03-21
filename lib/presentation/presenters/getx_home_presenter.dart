import 'package:get/get.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../../ui/pages/pages.dart';

class GetxHomePresenter extends GetxController implements HomePresenter {
  final LoadPosts loadPosts;
  final LoadCurrentUser loadCurrentUser;

  GetxHomePresenter({required this.loadPosts, required this.loadCurrentUser});

  final _user = Rx<UserViewModel?>();
  Stream<UserViewModel?> get userStream => _user.stream;

  @override
  Future<void> loadPostsData(String userUID) async {
    try {
      final UserEntity user = await loadCurrentUser.load(userUID);
      _user.value = UserViewModel(
        uid: user.uid,
        username: user.username,
        avatar: user.avatar,
        name: user.name,
      );
    } catch (_) {}
  }
}
