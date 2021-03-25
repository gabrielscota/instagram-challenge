import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../pages/pages.dart';

class GoogleLoginButton extends StatelessWidget {
  final LoginPresenter presenter;

  GoogleLoginButton({required this.presenter});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: presenter.authWithGoogle,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 12.0),
        elevation: 2.0,
        shadowColor: Theme.of(context).primaryColor.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'lib/ui/assets/icons/brands/google.svg',
            height: 24.0,
            width: 24.0,
          ),
          const SizedBox(width: 12.0),
          Text(
            'Entrar com o Google',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
