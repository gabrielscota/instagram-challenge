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
    );
  }
}
