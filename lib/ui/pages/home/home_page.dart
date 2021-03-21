import 'package:flutter/material.dart';

import '../../pages/pages.dart';
import './components/components.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;

  HomePage({required this.presenter});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  PageController? _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(
        builder: (context) {
          widget.presenter.loadPostsData('zB6a2El0OfkPL2VEuH9z');

          return PageView(
            controller: _pageController,
            allowImplicitScrolling: false,
            pageSnapping: true,
            physics: ClampingScrollPhysics(),
            onPageChanged: (value) {
              if (value == 2) {
                widget.presenter.loadPostsData('zB6a2El0OfkPL2VEuH9z');
              }
            },
            children: [
              Container(color: Colors.green),
              Stack(
                children: [
                  Feed(scrollController: _scrollController),
                  HomeAppBar(scrollController: _scrollController),
                  BottomNavigation(),
                ],
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
