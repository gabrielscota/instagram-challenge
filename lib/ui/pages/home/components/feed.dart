import 'package:flutter/material.dart';
import 'package:instagram_challenge/ui/pages/pages.dart';

import './components.dart';

class Feed extends StatelessWidget {
  final HomePresenter presenter;
  final ScrollController scrollController;

  const Feed({Key? key, required this.scrollController, required this.presenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 48.0),
        child: Column(
          children: [
            Stories(),
            StreamBuilder<List<PostViewModel>?>(
              stream: presenter.postsStream,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.length > 0) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => Post(
                      postViewModel: snapshot.data![index],
                    ),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                  );
                }
                return Center(
                  child: Text('Nenhum publicação encontrada.'),
                );
              },
            ),
            Container(height: 80.0, color: Theme.of(context).backgroundColor),
          ],
        ),
      ),
    );
  }
}
