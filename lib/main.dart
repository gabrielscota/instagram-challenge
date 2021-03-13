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
      backgroundColor: Colors.white,
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
            ],
          ),
        ),
      ),
    );
  }
}

class Storie extends StatelessWidget {
  final Image image;

  const Storie({@required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.0),
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.orange,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32.0),
            ),
            padding: const EdgeInsets.all(2.0),
            child: CircleAvatar(
              child: image,
              radius: 28,
            ),
          ),
        ),
        Container(
          width: 64,
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            'gabriel',
            style: Theme.of(context).textTheme.caption.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class Post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
        child: Container(
          height: 420,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          Image.asset('lib/ui/assets/images/avatar-0.png')
                              .image,
                      radius: 20,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'gabrielscota',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Text(
                              'Ouro Preto',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      'lib/ui/assets/icons/more-square.svg',
                      width: 28,
                      height: 28,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Image.asset(
                  'lib/ui/assets/images/post-0.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 2.0, 12.0, 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'lib/ui/assets/icons/heart.svg',
                          width: 28,
                          height: 28,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 12.0),
                        SvgPicture.asset(
                          'lib/ui/assets/icons/chat.svg',
                          width: 28,
                          height: 28,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 12.0),
                        SvgPicture.asset(
                          'lib/ui/assets/icons/send.svg',
                          width: 28,
                          height: 28,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 12.0),
                        Spacer(),
                        SvgPicture.asset(
                          'lib/ui/assets/icons/bookmark.svg',
                          width: 28,
                          height: 28,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [Text('Curtido por ...')],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
