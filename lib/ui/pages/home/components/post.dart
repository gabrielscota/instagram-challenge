import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
        child: Container(
          height: 420,
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
                    CircleAvatar(
                      backgroundImage:
                          Image.asset('lib/ui/assets/images/avatar-0.png')
                              .image,
                      radius: 20,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'gabrielscota',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Text(
                              'Ouro Preto',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      'lib/ui/assets/icons/more-square.svg',
                      width: 28,
                      height: 28,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Image.asset(
                  'lib/ui/assets/images/post-0.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 2.0, 12.0, 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'lib/ui/assets/icons/heart.svg',
                          width: 28,
                          height: 28,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 12.0),
                        SvgPicture.asset(
                          'lib/ui/assets/icons/chat.svg',
                          width: 28,
                          height: 28,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 12.0),
                        SvgPicture.asset(
                          'lib/ui/assets/icons/send.svg',
                          width: 28,
                          height: 28,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 12.0),
                        Spacer(),
                        SvgPicture.asset(
                          'lib/ui/assets/icons/bookmark.svg',
                          width: 28,
                          height: 28,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [Text('Curtido por ...')],
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
