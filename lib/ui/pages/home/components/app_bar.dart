import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar makeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    centerTitle: true,
    title: Text(
      'Instagram',
      style: Theme.of(context).textTheme.headline5?.copyWith(
            fontWeight: FontWeight.w500,
          ),
    ),
    leadingWidth: 48,
    leading: Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: SvgPicture.asset(
        'lib/ui/assets/icons/camera.svg',
        color: Theme.of(context).primaryColor,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: SvgPicture.asset(
          'lib/ui/assets/icons/send.svg',
          width: 32,
          height: 32,
          color: Theme.of(context).primaryColor,
        ),
      ),
    ],
  );
}
