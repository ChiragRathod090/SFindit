import 'package:flutter/material.dart';
import 'package:sfindit/screens/splash.dart';

import 'common/color.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
