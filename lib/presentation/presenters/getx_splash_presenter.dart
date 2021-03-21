import 'package:get/get.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../../ui/pages/pages.dart';
import '../mixins/mixins.dart';

class GetxSplashPresenter extends GetxController
    with NavigationManager
    implements SplashPresenter {
  final LoadCurrentUser loadCurrentUser;

  GetxSplashPresenter({required this.loadCurrentUser});

  Future<void> checkAccount({int durationInSeconds = 2}) async {
    await Future.delayed(Duration(seconds: durationInSeconds));
    try {
      final UserEntity account = await loadCurrentUser.load();
      navigateTo = account.uid.isNotEmpty ? '/home' : '/login';
    } catch (error) {
      navigateTo = '/login';
    }
  }
}
