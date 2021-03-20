import 'package:flutter/material.dart';

import './components/components.dart';

class HomePage extends StatefulWidget {
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
      body: PageView(
        controller: _pageController,
        allowImplicitScrolling: false,
        pageSnapping: true,
        physics: ClampingScrollPhysics(),
        children: [
          Container(color: Colors.green),
          Stack(
            children: [
              Feed(scrollController: _scrollController),
              HomeAppBar(scrollController: _scrollController),
              BottomNavigation(),
            ],
          ),
          Container(color: Colors.red),
        ],
      ),
    );
  }
}
