import 'package:flutter/material.dart';

import '../../../../constants.dart';
import './components.dart';

class Feed extends StatelessWidget {
  final ScrollController scrollController;

  const Feed({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 64.0),
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
            Container(height: 110.0, color: Theme.of(context).backgroundColor),
          ],
        ),
      ),
    );
  }
}
