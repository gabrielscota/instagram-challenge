import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatefulWidget {
  final ScrollController scrollController;

  const HomeAppBar({required this.scrollController});

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
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
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: isElevated
                ? Theme.of(context).primaryColor.withOpacity(0.1)
                : Colors.transparent,
            offset: Offset(0.0, 2.0),
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SvgPicture.asset(
              'lib/ui/assets/icons/broken/camera.svg',
              height: 32,
              width: 32,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Text(
            'Instagram',
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(
              'lib/ui/assets/icons/broken/send.svg',
              height: 32,
              width: 32,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
