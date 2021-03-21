import 'package:get/get.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../../ui/pages/pages.dart';

class GetxHomePresenter extends GetxController implements HomePresenter {
  final LoadPosts loadPosts;
  final LoadCurrentUser loadCurrentUser;

  GetxHomePresenter({required this.loadPosts, required this.loadCurrentUser});

  @override
  Future<void> loadPostsData(String userUID) async {
    try {
      final UserEntity user = await loadCurrentUser.load(userUID);
      await loadPosts.load(user.uid);
    } catch (_) {}
  }
}
