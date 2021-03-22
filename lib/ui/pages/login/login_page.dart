import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/helpers.dart';
import '../../mixins/mixins.dart';
import '../pages.dart';
import './components/components.dart';

class LoginPage extends StatelessWidget with KeyboardManager, UIErrorManager, NavigationManager {
  final LoginPresenter presenter;

  LoginPage({required this.presenter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          handleMainError(context, presenter.mainErrorStream);
          handleNavigation(presenter.navigateToStream, clear: true);

          return GestureDetector(
            onTap: () => hideKeyboard(context),
            child: Padding(
              padding: EdgeInsets.all(32),
              child: Provider<LoginPresenter>(
                create: (_) => presenter,
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EmailInput(),
                      Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 32),
                        child: PasswordInput(),
                      ),
                      LoginButton(),
                      TextButton.icon(
                        onPressed: presenter.goToSignUp,
                        icon: Icon(Icons.person),
                        label: Text(R.string.addAccount),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
