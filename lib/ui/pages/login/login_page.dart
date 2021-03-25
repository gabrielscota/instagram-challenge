import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            child: Provider<LoginPresenter>(
              create: (_) => presenter,
              child: Form(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height,
                      minWidth: MediaQuery.of(context).size.width,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(),
                        Padding(
                          padding: EdgeInsets.all(32),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                'lib/ui/assets/images/instagram-wordmark.svg',
                                height: 80.0,
                              ),
                              const SizedBox(height: 24.0),
                              FacebookLoginButton(),
                              const SizedBox(height: 12.0),
                              GoogleLoginButton(presenter: presenter),
                              const SizedBox(height: 20.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      'ou',
                                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                            color: Theme.of(context).primaryColor.withOpacity(0.6),
                                          ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 1,
                                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20.0),
                              EmailInput(),
                              const SizedBox(height: 10.0),
                              PasswordInput(),
                              const SizedBox(height: 16.0),
                              LoginButton(),
                              TextButton(
                                onPressed: presenter.goToSignUp,
                                child: Text(
                                  R.string.forgetPassword,
                                  style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.blue[400]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 56.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  border: Border(
                                    top: BorderSide(
                                      color: Colors.grey[300]!,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      R.string.dontHaveAccount,
                                      style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.grey[500]),
                                    ),
                                    TextButton(
                                      onPressed: presenter.goToSignUp,
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                                        alignment: Alignment.centerLeft,
                                      ),
                                      child: Text(
                                        R.string.addAccount,
                                        style: Theme.of(context).textTheme.subtitle2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
