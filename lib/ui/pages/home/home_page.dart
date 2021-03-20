import 'package:flutter/material.dart';

import './components/components.dart';

class HomePage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppBar(scrollController: _scrollController),
      body: Stack(
        children: [
          Feed(scrollController: _scrollController),
          BottomNavigation(),
        ],
      ),
    );
  }
}
