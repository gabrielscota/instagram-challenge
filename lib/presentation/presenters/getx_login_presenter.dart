import 'package:get/get.dart';

import '../../domain/entities/entities.dart';
import '../../ui/helpers/helpers.dart';
import '../../ui/pages/pages.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';
import '../protocols/protocols.dart';
import '../mixins/mixins.dart';

class GetxLoginPresenter extends GetxController
    with LoadingManager, NavigationManager, FormManager, UIErrorManager
    implements LoginPresenter {
  final Validation validation;
  final UserAuthentication authentication;
  final UserGoogleSignIn userGoogleSignIn;
  final UserFacebookSignIn userFacebookSignIn;
  final SaveCurrentUser saveCurrentUser;

  final _emailError = Rx<UIError>();
  final _passwordError = Rx<UIError>();

  String? _email;
  String? _password;

  Stream<UIError?> get emailErrorStream => _emailError.stream;
  Stream<UIError?> get passwordErrorStream => _passwordError.stream;

  GetxLoginPresenter({
    required this.validation,
    required this.authentication,
    required this.userGoogleSignIn,
    required this.userFacebookSignIn,
    required this.saveCurrentUser,
  });

  void validateEmail(String email) {
    _email = email;
    _emailError.value = _validateField('email');
    _validateForm();
  }

  void validatePassword(String password) {
    _password = password;
    _passwordError.value = _validateField('password');
    _validateForm();
  }

  UIError? _validateField(String field) {
    final formData = {
      'email': _email,
      'password': _password,
    };
    final error = validation.validate(field: field, input: formData);
    switch (error) {
      case ValidationError.invalidField:
        return UIError.invalidField;
      case ValidationError.requiredField:
        return UIError.requiredField;
      case ValidationError.noError:
        return null;
    }
  }

  void _validateForm() {
    isFormValid = _emailError.value == null && _passwordError.value == null && _email != null && _password != null;
  }

  Future<void> auth() async {
    try {
      mainError = null;
      isLoading = true;
      await Future.delayed(const Duration(seconds: 2));
      final userUID = await authentication.auth(
        AuthenticationParams(email: _email!, password: _password!),
      );
      await saveCurrentUser.save(userUID: userUID);
      navigateTo = '/home';
    } on DomainError catch (error) {
      switch (error) {
        case DomainError.invalidCredentials:
          mainError = UIError.invalidCredentials;
          break;
        default:
          mainError = UIError.unexpected;
          break;
      }
      isLoading = false;
    }
  }

  Future<void> authWithGoogle() async {
    try {
      mainError = null;
      isLoading = true;
      await Future.delayed(const Duration(seconds: 2));
      final userUID = await userGoogleSignIn.authWithGoogle(
        GoogleSignUpParams(
          user: UserEntity(
            uid: '',
            email: '',
            username: '',
            avatar: '',
            name: '',
            posts: [],
            followers: [],
            following: [],
            createdAt: DateTime.now().toIso8601String(),
            updatedAt: DateTime.now().toIso8601String(),
            deletedAt: '',
          ),
        ),
      );
      await saveCurrentUser.save(userUID: userUID);
      isLoading = false;
      navigateTo = '/home';
    } on DomainError {
      mainError = UIError.unexpected;
      isLoading = false;
    }
  }

  Future<void> authWithFacebook() async {
    try {
      mainError = null;
      isLoading = true;
      await Future.delayed(const Duration(seconds: 2));
      final userUID = await userFacebookSignIn.authWithFacebook(
        FacebookSignUpParams(
          user: UserEntity(
            uid: '',
            email: '',
            username: '',
            avatar: '',
            name: '',
            posts: [],
            followers: [],
            following: [],
            createdAt: DateTime.now().toIso8601String(),
            updatedAt: DateTime.now().toIso8601String(),
            deletedAt: '',
          ),
        ),
      );
      await saveCurrentUser.save(userUID: userUID);
      isLoading = false;
      navigateTo = '/home';
    } on DomainError {
      mainError = UIError.unexpected;
      isLoading = false;
    }
  }

  void goToSignUp() {
    navigateTo = '/signup';
  }
}
