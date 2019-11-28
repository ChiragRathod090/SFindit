import 'package:flutter/material.dart';

import 'images.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> withOpacity;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Opacity(
              opacity: 1.0,
              child: Image.asset(
                Images.LOGO_TRANSPARENT,
                width: 24.0,
                height: 24.0,
              ),
            ),
            SizedBox(
                height: 50.0,
                width: 50.0,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
