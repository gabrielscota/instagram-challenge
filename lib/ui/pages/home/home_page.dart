import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';
import '../../../constants.dart';
import './components/components.dart';

class HomePage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppBar(scrollController: _scrollController),
      body: SingleChildScrollView(
        controller: _scrollController,
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
      ),
    );
  }
}

class Stories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(24.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.05),
            offset: Offset(0.0, 4.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: ListView.separated(
        itemCount: stories.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Storie(
              storieEntity: StorieEntity(
                user: loggedUser,
              ),
              isFirst: true,
            );
          }
          return Storie(
            storieEntity: stories[index - 1],
            isFirst: false,
          );
        },
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        separatorBuilder: (context, index) => SizedBox(width: 12.0),
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
