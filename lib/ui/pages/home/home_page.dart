import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../domain/entities/entities.dart';
import '../../../constants.dart';
import './components/components.dart';

class HomePage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppBar(scrollController: _scrollController),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Stories(),
                ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) => Post(
                    postEntity: posts[index],
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                ),
                const SizedBox(height: 32.0),
              ],
            ),
          ),
          Positioned(
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
          ),
        ],
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  final String enabledIcon;
  final String disabledIcon;
  final bool isActive;

  const NavigationItem({
    Key? key,
    required this.enabledIcon,
    required this.disabledIcon,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          isActive ? enabledIcon : disabledIcon,
          width: 28.0,
          height: 28.0,
          color: Theme.of(context).backgroundColor,
        ),
        Container(
          width: 8,
          height: 2,
          margin: const EdgeInsets.only(top: 4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.0),
            color: isActive
                ? Theme.of(context).backgroundColor
                : Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}

class Stories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(24.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.05),
            offset: Offset(0.0, 4.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: ListView.separated(
        itemCount: stories.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Storie(
              storieEntity: StorieEntity(
                id: '0',
                user: loggedUser,
              ),
              isFirst: true,
            );
          }
          return Storie(
            storieEntity: stories[index - 1],
            isFirst: false,
          );
        },
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        separatorBuilder: (context, index) => SizedBox(width: 12.0),
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
