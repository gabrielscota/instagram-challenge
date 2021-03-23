import 'package:flutter/material.dart';
import 'package:instagram_challenge/ui/mixins/mixins.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../helpers/helpers.dart';
import '../signup.dart';

class SignUpButton extends StatelessWidget with KeyboardManager {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<SignupPresenter>(context);

    return Container(
      height: 52,
      width: double.infinity,
      child: StreamBuilder<bool?>(
        stream: presenter.isFormValidStream,
        builder: (context, snapshot) {
          return ElevatedButton(
            onPressed: snapshot.data == true
                ? () {
                    hideKeyboard(context);
                    presenter.signup();
                  }
                : null,
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              elevation: 2.0,
              shadowColor: Theme.of(context).primaryColor.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            child: StreamBuilder<bool?>(
              stream: presenter.isLoadingStream,
              builder: (context, snapshot) {
                if (snapshot.data == true) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: LottieBuilder.asset(
                      'lib/ui/assets/animations/loading-white.json',
                      repeat: true,
                      fit: BoxFit.fitHeight,
                    ),
                  );
                } else {
                  return Text(
                    R.string.signUp,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
