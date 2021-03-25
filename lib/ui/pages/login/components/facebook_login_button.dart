import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../pages.dart';

class FacebookLoginButton extends StatelessWidget {
  final LoginPresenter presenter;

  FacebookLoginButton({required this.presenter});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: presenter.authWithFacebook,
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(1, 99, 224, 1.0),
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
            'lib/ui/assets/icons/brands/facebook.svg',
            height: 24.0,
            width: 24.0,
          ),
          const SizedBox(width: 12.0),
          Text(
            'Entrar com o Facebook',
            style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
