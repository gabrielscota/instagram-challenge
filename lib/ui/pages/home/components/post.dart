import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import '../../pages.dart';
import './components.dart';

class Post extends StatefulWidget {
  final PostViewModel postViewModel;

  const Post({required this.postViewModel});

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.05),
                offset: Offset(4.0, 4.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.circular(20.0),
                      child: CircleAvatar(
                        child: widget.postViewModel.user.avatar != ''
                            ? CachedNetworkImage(
                                imageUrl: widget.postViewModel.user.avatar,
                                fit: BoxFit.cover,
                              )
                            : FlutterLogo(),
                        // backgroundImage: Image.network(widget.postViewModel.user.avatar).image,
                        radius: 20,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.postViewModel.user.username,
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Visibility(
                              visible: widget.postViewModel.subtitle != '',
                              child: Text(
                                widget.postViewModel.subtitle,
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      'lib/ui/assets/icons/broken/more-square.svg',
                      width: 28,
                      height: 28,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      offset: Offset(2.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: CachedNetworkImage(
                    imageUrl: widget.postViewModel.imageUrl,
                    height: 420,
                    // height: imageLoaded.height > 3600 ? 420 : 320,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'lib/ui/assets/icons/broken/heart.svg',
                          width: 28,
                          height: 28,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 12.0),
                        SvgPicture.asset(
                          'lib/ui/assets/icons/broken/chat.svg',
                          width: 28,
                          height: 28,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 12.0),
                        SvgPicture.asset(
                          'lib/ui/assets/icons/broken/send.svg',
                          width: 28,
                          height: 28,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 12.0),
                        Spacer(),
                        SvgPicture.asset(
                          'lib/ui/assets/icons/broken/bookmark.svg',
                          width: 28,
                          height: 28,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    if (widget.postViewModel.likes.length > 0)
                      Row(
                        children: [
                          Wrap(
                            children: [
                              CircleAvatar(
                                backgroundImage: Image.asset('lib/ui/assets/images/avatar-0.png').image,
                                radius: 8,
                              ),
                              Visibility(
                                visible: widget.postViewModel.likes.length > 1,
                                child: Transform.translate(
                                  offset: Offset(-4.0, 0.0),
                                  child: CircleAvatar(
                                    backgroundImage: Image.asset('lib/ui/assets/images/avatar-1.png').image,
                                    radius: 8,
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: widget.postViewModel.likes.length > 2,
                                child: Transform.translate(
                                  offset: Offset(-8.0, 0.0),
                                  child: CircleAvatar(
                                    backgroundImage: Image.asset('lib/ui/assets/images/avatar-2.png').image,
                                    radius: 8,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Curtido por ',
                                style: Theme.of(context).textTheme.bodyText2?.copyWith(letterSpacing: 0.1),
                              ),
                              InkWell(
                                child: Text(
                                  widget.postViewModel.likes[0].username,
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                              ),
                              Text(
                                ' e ',
                                style: Theme.of(context).textTheme.bodyText2?.copyWith(letterSpacing: 0.1),
                              ),
                              InkWell(
                                onTap: () => showPostLikes(context, widget.postViewModel.likes),
                                child: Text(
                                  '${widget.postViewModel.likes.length - 1} outros',
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
