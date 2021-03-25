import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

SignUpPresenter makeGetxSignupPresenter() => GetxSignupPresenter(
      validation: makeSignupValidation(),
      userAuthentication: makeRemoteUserAuthentication(),
      userGoogleSignIn: makeRemoteUserGoogleSignIn(),
      userSignUp: makeRemoteUserSignUp(),
      saveCurrentUser: makeLocalSaveCurrentUser(),
    );
