import 'package:flutter/material.dart';
import 'package:sfindit/screens/splash.dart';

import 'common/color.dart';
import 'common/pref.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Pref.init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: appColor, dividerColor: Colors.grey[400]),
      home: SplashScreen(),
    );
  }
}
