import 'package:flutter/material.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/screens/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(microseconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(Images.SPLASH_BACKGROUND),
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }
}
