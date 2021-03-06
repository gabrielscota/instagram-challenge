import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helpers/helpers.dart';
import '../login.dart';

class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);

    return StreamBuilder<UIError?>(
      stream: presenter.passwordErrorStream,
      builder: (context, snapshot) {
        return TextFormField(
          decoration: InputDecoration(
            labelText: R.string.password,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(
                color: Colors.red[400]!,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1.0,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(
                color: Colors.red[400]!,
                width: 1.0,
              ),
            ),
            errorText: snapshot.hasData ? snapshot.data!.description : null,
            contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
            labelStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: Theme.of(context).primaryColor.withOpacity(0.4),
                ),
          ),
          style: Theme.of(context).textTheme.subtitle1,
          obscureText: true,
          onChanged: presenter.validatePassword,
        );
      },
    );
  }
}
