import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './ui/components/components.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram App Challenge',
      home: HomePage(),
      theme: makeAppTheme(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Instagram',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        leadingWidth: 48,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: SvgPicture.asset(
            'lib/ui/assets/icons/camera.svg',
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(
              'lib/ui/assets/icons/send.svg',
              width: 32,
              height: 32,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 100,
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
                  itemCount: 10,
                  itemBuilder: (context, index) => CircleAvatar(
                    child: Text(index.toString()),
                  ),
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  separatorBuilder: (context, index) => SizedBox(width: 8.0),
                  physics: BouncingScrollPhysics(),
                ),
              ),
              Post(),
              Post(),
              Post(),
            ],
          ),
        ),
      ),
    );
  }
}

class Post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 0.0),
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.05),
              offset: Offset(4.0, 4.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Text('G'),
                    radius: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('gabrielscota'),
                          Text('Ouro Preto'),
                        ],
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    'lib/ui/assets/icons/more-square.svg',
                    width: 28,
                    height: 28,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
