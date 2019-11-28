import 'package:flutter/material.dart';
import 'package:sfindit/common/constants.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/keys.dart';
import 'package:sfindit/common/pref.dart';
import 'package:sfindit/screens/home.dart';
import 'package:sfindit/screens/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Pref.init();
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      checkLogin();
    });
  }

  checkLogin() async {
    String userId = await getPrefValue(Keys.USER_ID);
    print("USER ID : " + userId);
    if (userId != "") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      goToLoginScreen();
    }
  }

  goToLoginScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
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
