import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../pages/pages.dart';
import './components.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomePresenter presenter = Provider.of<HomePresenter>(context);

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
              enabledIcon: 'lib/ui/assets/icons/bold/home.svg',
              disabledIcon: 'lib/ui/assets/icons/broken/home.svg',
              isActive: true,
              action: () {},
            ),
            NavigationItem(
              enabledIcon: 'lib/ui/assets/icons/bold/search.svg',
              disabledIcon: 'lib/ui/assets/icons/broken/search.svg',
              isActive: false,
              action: () {},
            ),
            NavigationItem(
              enabledIcon: 'lib/ui/assets/icons/bold/plus.svg',
              disabledIcon: 'lib/ui/assets/icons/broken/plus.svg',
              isActive: false,
              action: () {},
            ),
            NavigationItem(
              enabledIcon: 'lib/ui/assets/icons/bold/heart.svg',
              disabledIcon: 'lib/ui/assets/icons/broken/heart.svg',
              isActive: false,
              action: () {},
            ),
            NavigationItem(
              enabledIcon: 'lib/ui/assets/icons/bold/profile.svg',
              disabledIcon: 'lib/ui/assets/icons/broken/profile.svg',
              isActive: false,
              action: presenter.logout,
            ),
          ],
        ),
      ),
    );
  }
}
