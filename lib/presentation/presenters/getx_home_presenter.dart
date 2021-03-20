import 'package:get/get.dart';

import '../../domain/usecases/usecases.dart';
import '../../ui/pages/pages.dart';

class GetxHomePresenter extends GetxController implements HomePresenter {
  final LoadPosts loadPosts;

  GetxHomePresenter({required this.loadPosts});

  @override
  Future<void> loadPostsData() async {
    try {
      await loadPosts.load();
    } catch (_) {}
  }
}
