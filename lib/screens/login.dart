import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/string.dart';
import 'package:sfindit/screens/home.dart';

const CURVE_HEIGHT = 160.0;
const AVATAR_RADIUS = CURVE_HEIGHT * 0.28;
const AVATAR_DIAMETER = AVATAR_RADIUS * 2;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode userNameFocusNode;
  FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context) {
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
                Text(lblLogin,
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(fontSize: 35.0)),
                //style: TextStyle(fontSize: 35)),
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
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  autocorrect: false,
                  focusNode: userNameFocusNode,
                  decoration: InputDecoration.collapsed(hintText: hintUsername),
                  onFieldSubmitted: (term) {
                    _fieldFocusChange(
                        context, userNameFocusNode, passwordFocusNode);
                  },
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
              child: TextFormField(
                obscureText: true,
                focusNode: passwordFocusNode,
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
              child: Text(txtLogin,
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(fontSize: 20.0)),
              //style: TextStyle(fontSize: 20)),
              color: orangeColor,
              padding: EdgeInsets.only(left: 50.0, right: 50.0),
              textColor: whiteColor,
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

class RoundedAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new SizedBox.fromSize(
          size: preferredSize,
          child: new LayoutBuilder(builder: (context, constraint) {
            final width = constraint.maxWidth * 18;
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
        Image(
          image: AssetImage(Images.LOGO_TRANSPARENT),
          width: 250.0,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(260.0);
}
