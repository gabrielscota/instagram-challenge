import 'package:get/get.dart';

import '../../ui/helpers/helpers.dart';
import '../../ui/pages/pages.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';
import '../protocols/protocols.dart';
import '../mixins/mixins.dart';

class GetxSignupPresenter extends GetxController
    with LoadingManager, NavigationManager, FormManager, UIErrorManager
    implements SignupPresenter {
  final Validation validation;
  final Authentication authentication;
  final SaveCurrentUser saveCurrentUser;

  final _emailError = Rx<UIError>();
  final _passwordError = Rx<UIError>();

  String? _email;
  String? _password;

  Stream<UIError?> get emailErrorStream => _emailError.stream;
  Stream<UIError?> get passwordErrorStream => _passwordError.stream;

  GetxSignupPresenter({
    required this.validation,
    required this.authentication,
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
      await saveCurrentUser.save(userUID);
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

  void goToLogin() {
    navigateTo = '/login';
  }
}
