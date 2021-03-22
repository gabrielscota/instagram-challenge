import 'package:flutter/material.dart';
import 'package:instagram_challenge/ui/mixins/mixins.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../helpers/helpers.dart';
import '../login.dart';

class LoginButton extends StatelessWidget with KeyboardManager {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);

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
                    presenter.auth();
                  }
                : null,
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
                  return Text(R.string.enter.toUpperCase());
                }
              },
            ),
          );
        },
      ),
    );
  }
}
