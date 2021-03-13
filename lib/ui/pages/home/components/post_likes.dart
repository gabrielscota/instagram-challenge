import 'package:flutter/material.dart';

void showPostLikes(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 64,
          height: 8,
          margin: const EdgeInsets.only(top: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Theme.of(context).primaryColor.withOpacity(0.1),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'Curtidas',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        UserLiked(
          userPhoto: Image.asset('lib/ui/assets/images/avatar-1.png').image,
          username: 'alexis',
          name: 'Alexis Scott',
        ),
        UserLiked(
          userPhoto: Image.asset('lib/ui/assets/images/avatar-2.png').image,
          username: 'brian',
          name: 'Brian Spil',
        ),
        const SizedBox(height: 16.0),
      ],
    ),
  );
}

class UserLiked extends StatelessWidget {
  final ImageProvider userPhoto;
  final String username;
  final String name;

  const UserLiked({this.userPhoto, this.username, this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: userPhoto,
            radius: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    username,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    name,
                    style: Theme.of(context).textTheme.caption,
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
