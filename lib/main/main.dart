import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../ui/components/components.dart';
import './factories/factories.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initMessaging();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram App Challenge',
      navigatorObservers: [routeObserver!],
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: makeHomePage, transition: Transition.fadeIn),
      ],
      theme: makeAppTheme(),
    );
  }
}
