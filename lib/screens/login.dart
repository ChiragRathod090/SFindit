import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/string.dart';

const CURVE_HEIGHT = 160.0;
const AVATAR_RADIUS = CURVE_HEIGHT * 0.28;
const AVATAR_DIAMETER = AVATAR_RADIUS * 2;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    FocusNode nodeOne = FocusNode();
    FocusNode nodeTwo = FocusNode();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            RoundedAppBar(),
            SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                Container(
                  color: orangeColor,
                  height: 60,
                  width: 8,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  lblLogin,
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: new EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  /*focusNode: nodeOne,*/

                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  autocorrect: false,
                  autofocus: true,
                  decoration: InputDecoration.collapsed(hintText: hintUsername),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: new EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                autocorrect: false,
                decoration: InputDecoration.collapsed(hintText: hintPassword),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Text(txtLogin, style: TextStyle(fontSize: 20)),
              color: orangeColor,
              padding: EdgeInsets.only(left: 50.0, right: 50.0),
              textColor: whiteColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SizedBox.fromSize(
          size: preferredSize,
          child: new LayoutBuilder(builder: (context, constraint) {
            final width = constraint.maxWidth * 16;
            return new ClipRect(
              child: new OverflowBox(
                maxHeight: double.infinity,
                maxWidth: double.infinity,
                child: new SizedBox(
                  width: width,
                  height: width,
                  child: new Padding(
                    padding: new EdgeInsets.only(
                        bottom: width / 2 - preferredSize.height / 2),
                    child: new DecoratedBox(
                      decoration: new BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
        Image.asset(
          Images.LOGO_TRANSPARENT,
          height: 250,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(250.0);
}
