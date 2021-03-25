import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

SignupPresenter makeGetxSignupPresenter() => GetxSignupPresenter(
      validation: makeSignupValidation(),
      userAuthentication: makeRemoteUserAuthentication(),
      userSignUp: makeRemoteUserSignUp(),
      saveCurrentUser: makeLocalSaveCurrentUser(),
    );
