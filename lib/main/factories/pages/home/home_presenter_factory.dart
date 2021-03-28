import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

HomePresenter makeGetxHomePresenter() => GetxHomePresenter(
      loadUserFollowPosts: makeRemoteLoadUserFollowingPosts(),
      loadUserSelf: makeRemoteLoadUserSelf(),
      deleteCurrentUser: makeLocalDeleteCurrentUser(),
      userLogout: makeRemoteLogout(),
    );
