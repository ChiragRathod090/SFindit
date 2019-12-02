import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfindit/Model/login.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/common/constants.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/input_type_validation.dart';
import 'package:sfindit/common/keys.dart';
import 'package:sfindit/common/loding.dart';
import 'package:sfindit/common/string.dart';
import 'package:sfindit/rest/api_services.dart';
import 'package:sfindit/screens/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Login loginResponse;

  FocusNode userNameFocusNode;
  FocusNode passwordFocusNode;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var isValidation = false;
  String _email;
  String _password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidate: isValidation,
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
                    focusNode: userNameFocusNode,
                    autocorrect: false,
                    decoration:
                        InputDecoration.collapsed(hintText: hintUsername),
                    validator: InputValidation.validateEmail,
                    onSaved: (val) {
                      _email = val;
                    },
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
                  validator: InputValidation.validatePassword,
                  onSaved: (val) {
                    _password = val;
                  },
                  onFieldSubmitted: (term) {},
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
                        .copyWith(fontSize: 20.0, color: whiteColor)),
                color: orangeColor,
                padding: EdgeInsets.only(left: 50.0, right: 50.0),
                textColor: whiteColor,
                onPressed: () {
                  if (isValidate()) loginApi();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isValidate() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      return true;
    } else {
      isValidation = true;
      return false;
    }
  }

  void loginApi() {
    showDialog(context: context, builder: (context) => Loading());
    print(getParameters());
    login(getParameters()).then((response) {
      var data = json.decode(response.body);
      print(data);
      //Navigator.pop(context);
      if (data['success'] == 1) {
        loginResponse = Login.fromMap(json.decode(response.body));
        setPrefValue(Keys.USER_ID, loginResponse.result.userId);
        setPrefValue(Keys.NAME, loginResponse.result.name);
        setPrefValue(Keys.NICK_NAME, loginResponse.result.nickname);
        setPrefValue(Keys.PROFILE_PIC, loginResponse.result.profilePic);
        setPrefValue(Keys.EMAIL, loginResponse.result.email);
        setPrefValue(
            Keys.EMERGENCY_CONTACT, loginResponse.result.emergencyContact);
        setPrefValue(Keys.MOBILE, loginResponse.result.mobile);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        dialog(data['message'].toString(), context);
      }
    });
  }

  getParameters() {
    String param = "&email=$_email&password=$_password";
    return param;
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
