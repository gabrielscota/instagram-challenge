import 'package:flutter/material.dart';

import 'components.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
          color: Theme.of(context).primaryColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavigationItem(
              enabledIcon: 'lib/ui/assets/icons/home.svg',
              disabledIcon: 'lib/ui/assets/icons/home.svg',
              isActive: true,
            ),
            NavigationItem(
              enabledIcon: 'lib/ui/assets/icons/search.svg',
              disabledIcon: 'lib/ui/assets/icons/search.svg',
              isActive: false,
            ),
            NavigationItem(
              enabledIcon: 'lib/ui/assets/icons/plus.svg',
              disabledIcon: 'lib/ui/assets/icons/plus.svg',
              isActive: false,
            ),
            NavigationItem(
              enabledIcon: 'lib/ui/assets/icons/heart.svg',
              disabledIcon: 'lib/ui/assets/icons/heart.svg',
              isActive: false,
            ),
            NavigationItem(
              enabledIcon: 'lib/ui/assets/icons/profile.svg',
              disabledIcon: 'lib/ui/assets/icons/profile.svg',
              isActive: false,
            ),
          ],
        ),
      ),
    );
  }
}
