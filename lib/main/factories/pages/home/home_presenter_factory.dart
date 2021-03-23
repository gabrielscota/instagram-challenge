import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

HomePresenter makeGetxHomePresenter() => GetxHomePresenter(
      loadPosts: makeRemoteLoadPosts(),
      loadUserSelf: makeRemoteLoadUserSelf(),
      deleteCurrentUser: makeLocalDeleteCurrentUser(),
      userLogout: makeRemoteLogout(),
    );
