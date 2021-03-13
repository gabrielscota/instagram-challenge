import 'package:flutter/material.dart';

import './components/components.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: makeAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 120,
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
                  itemCount: 7,
                  itemBuilder: (context, index) => Storie(
                    image:
                        Image.asset('lib/ui/assets/images/avatar-$index.png'),
                  ),
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  separatorBuilder: (context, index) => SizedBox(width: 12.0),
                  physics: BouncingScrollPhysics(),
                ),
              ),
              Post(),
              Post(),
              Post(),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}
