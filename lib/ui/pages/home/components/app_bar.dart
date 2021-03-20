import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  final ScrollController scrollController;

  const HomeAppBar({required this.scrollController});

  @override
  _HomeAppBarState createState() => _HomeAppBarState();

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool isElevated = false;

  @override
  void initState() {
    widget.scrollController
      ..addListener(() {
        if (widget.scrollController.offset > 0 && !isElevated && mounted) {
          setState(() {
            isElevated = true;
          });
        } else if (widget.scrollController.offset <= 0 &&
            isElevated &&
            mounted) {
          setState(() {
            isElevated = false;
          });
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: isElevated ? 2.0 : 0.0,
      shadowColor: Theme.of(context).primaryColor.withOpacity(0.3),
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
          'lib/ui/assets/icons/broken/camera.svg',
          color: Theme.of(context).primaryColor,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: SvgPicture.asset(
            'lib/ui/assets/icons/broken/send.svg',
            width: 32,
            height: 32,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
