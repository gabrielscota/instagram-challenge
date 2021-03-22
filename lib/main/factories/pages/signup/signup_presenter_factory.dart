import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

SignupPresenter makeGetxSignupPresenter() => GetxSignupPresenter(
      authentication: makeRemoteAuthentication(),
      validation: makeLoginValidation(),
      saveCurrentUser: makeLocalSaveCurrentUser(),
    );
