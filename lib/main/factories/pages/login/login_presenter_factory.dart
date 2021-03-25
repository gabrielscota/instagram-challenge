import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

LoginPresenter makeGetxLoginPresenter() => GetxLoginPresenter(
      validation: makeLoginValidation(),
      authentication: makeRemoteUserAuthentication(),
      userGoogleSignIn: makeRemoteUserGoogleSignIn(),
      saveCurrentUser: makeLocalSaveCurrentUser(),
    );
