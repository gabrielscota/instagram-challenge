import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './ui/components/components.dart';
import './ui/pages/pages.dart';

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
