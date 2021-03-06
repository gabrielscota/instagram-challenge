import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationItem extends StatelessWidget {
  final String enabledIcon;
  final String disabledIcon;
  final bool isActive;
  final Function()? action;

  const NavigationItem({
    Key? key,
    required this.enabledIcon,
    required this.disabledIcon,
    required this.isActive,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
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
              color: isActive ? Theme.of(context).backgroundColor : Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
