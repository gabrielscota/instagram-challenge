import 'package:flutter/material.dart';

import '../../pages.dart';

void showPostLikes(BuildContext context, List<UserLikeViewModel> likes) {
  final ScrollController scrollController = ScrollController();
  bool dispose = false;

  scrollController.addListener(() {
    if (scrollController.offset <= -40 && dispose == false) {
      Navigator.of(context).pop();
      dispose = true;
    }
  });

  showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      isScrollControlled: true,
      enableDrag: true,
      builder: (context) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.7,
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                    style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                ListView.builder(
                  itemCount: likes.length,
                  itemBuilder: (context, index) => UserLiked(
                    userPhoto: Image.asset(likes[index].avatar).image,
                    username: likes[index].username,
                    name: likes[index].name,
                  ),
                  physics: BouncingScrollPhysics(),
                  primary: true,
                  shrinkWrap: true,
                ),
                // const SizedBox(height: 16.0),
              ],
            ),
          ),
        );
      });
}

class UserLiked extends StatelessWidget {
  final ImageProvider userPhoto;
  final String username;
  final String name;

  const UserLiked({
    required this.userPhoto,
    required this.username,
    required this.name,
  });

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
