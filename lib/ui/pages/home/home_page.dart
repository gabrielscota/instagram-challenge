import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../mixins/mixins.dart';
import '../../pages/pages.dart';
import './components/components.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;

  HomePage({required this.presenter});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with NavigationManager {
  final ScrollController _scrollController = ScrollController();

  PageController? _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 1, keepPage: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) {
          handleNavigation(widget.presenter.navigateToStream, clear: true);
          widget.presenter.loadUser('070SmR0SuqaI9wpCOeX8ADNLn2K3');
          widget.presenter.loadUserFollowingPosts('070SmR0SuqaI9wpCOeX8ADNLn2K3');

          return PageView(
            controller: _pageController,
            pageSnapping: true,
            physics: PageScrollPhysics(),
            children: [
              Container(color: Colors.green),
              Provider(
                create: (_) => widget.presenter,
                child: Stack(
                  children: [
                    Feed(scrollController: _scrollController, presenter: widget.presenter),
                    HomeAppBar(scrollController: _scrollController),
                    BottomNavigation(),
                  ],
                ),
              ),
              StreamBuilder<UserViewModel?>(
                stream: widget.presenter.userStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(snapshot.data!.uid),
                        Text(snapshot.data!.username),
                        Text(snapshot.data!.name),
                      ],
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
