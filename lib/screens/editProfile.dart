import 'package:flutter/material.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/string.dart';
import 'package:sfindit/utils/appbar.dart';

import 'home.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  FocusNode nameFocusNode;
  FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(txtEditProfile, false),
      body: Column(
        children: <Widget>[
          Image.asset(
            Images.APPBAR_HEADER,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20.0),
                    height: 150.0,
                    width: 150.0,
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: new BorderRadius.circular(70.0),
                          child: Image.asset(
                            "assets/images/jocker.jpg",
                            height: 140.0,
                            width: 140.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                          child: Image.asset(
                            Images.SELECT_IMAGE,
                            height: 50.0,
                            width: 50.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            hintName,
                            style: Theme.of(context).textTheme.body1.copyWith(
                                fontSize: 14.0, color: Colors.grey[600]),
//                            style: TextStyle(
//                              fontSize: 14,
//                              color: Colors.grey[600],
//                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: new EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 10.0, top: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontSize: 16.0, color: blackColor),
                        //style: (TextStyle(color: blackColor, fontSize: 16)),
                        textInputAction: TextInputAction.next,
                        autocorrect: false,
                        focusNode: nameFocusNode,
                        decoration:
                            InputDecoration.collapsed(hintText: hintName),
                        onFieldSubmitted: (term) {
                          _fieldFocusChange(
                              context, nameFocusNode, passwordFocusNode);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            hintNickName,
                            style: Theme.of(context).textTheme.body1.copyWith(
                                fontSize: 14.0, color: Colors.grey[600]),
//                            style: TextStyle(
//                              fontSize: 14,
//                              color: Colors.grey[600],
//                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: new EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 10.0, top: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontSize: 16.0, color: blackColor),
                        //style: (TextStyle(color: blackColor, fontSize: 16)),
                        textInputAction: TextInputAction.next,
                        autocorrect: false,
                        focusNode: nameFocusNode,
                        decoration:
                            InputDecoration.collapsed(hintText: hintNickName),
                        onFieldSubmitted: (term) {
                          _fieldFocusChange(
                              context, nameFocusNode, passwordFocusNode);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            hintEmail,
                            style: Theme.of(context).textTheme.body1.copyWith(
                                fontSize: 14.0, color: Colors.grey[600]),
//                            style: TextStyle(
//                              fontSize: 14,
//                              color: Colors.grey[600],
//                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: new EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 10.0, top: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontSize: 16.0, color: blackColor),
                        //style: (TextStyle(color: blackColor, fontSize: 16)),
                        textInputAction: TextInputAction.next,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        focusNode: nameFocusNode,
                        decoration:
                            InputDecoration.collapsed(hintText: hintEmail),
                        onFieldSubmitted: (term) {
                          _fieldFocusChange(
                              context, nameFocusNode, passwordFocusNode);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            hintPhoneNumber,
                            style: Theme.of(context).textTheme.body1.copyWith(
                                fontSize: 14.0, color: Colors.grey[600]),
//                            style: TextStyle(
//                              fontSize: 14,
//                              color: Colors.grey[600],
//                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: new EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 10.0, top: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontSize: 16.0, color: blackColor),
                        //style: (TextStyle(color: blackColor, fontSize: 16)),
                        textInputAction: TextInputAction.next,
                        autocorrect: false,
                        keyboardType: TextInputType.number,
                        focusNode: nameFocusNode,
                        decoration: InputDecoration.collapsed(
                            hintText: hintPhoneNumber),
                        onFieldSubmitted: (term) {
                          _fieldFocusChange(
                              context, nameFocusNode, passwordFocusNode);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            hintEmergencyContactName,
                            style: Theme.of(context).textTheme.body1.copyWith(
                                fontSize: 14.0, color: Colors.grey[600]),
//                            style: TextStyle(
//                              fontSize: 14,
//                              color: Colors.grey[600],
//                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: new EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 10.0, top: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontSize: 16.0, color: blackColor),
                        //style: (TextStyle(color: blackColor, fontSize: 16)),
                        textInputAction: TextInputAction.next,
                        autocorrect: false,
                        focusNode: nameFocusNode,
                        decoration: InputDecoration.collapsed(
                            hintText: hintEmergencyContactName),
                        onFieldSubmitted: (term) {
                          _fieldFocusChange(
                              context, nameFocusNode, passwordFocusNode);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            hintEmergencyContact,
                            style: Theme.of(context).textTheme.body1.copyWith(
                                fontSize: 14.0, color: Colors.grey[600]),
//                            style: TextStyle(
//                              fontSize: 14,
//                              color: Colors.grey[600],
//                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: new EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 10.0, top: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontSize: 16.0, color: blackColor),
                        //style: (TextStyle(color: blackColor, fontSize: 16)),
                        textInputAction: TextInputAction.next,
                        autocorrect: false,
                        keyboardType: TextInputType.number,
                        focusNode: nameFocusNode,
                        decoration: InputDecoration.collapsed(
                            hintText: hintEmergencyContact),
                        onFieldSubmitted: (term) {
                          _fieldFocusChange(
                              context, nameFocusNode, passwordFocusNode);
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Text(
                        txtSave,
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontSize: 20.0, color: whiteColor),
                        //style: TextStyle(fontSize: 20)
                      ),
                      color: orangeColor,
                      padding: EdgeInsets.only(
                          left: 50.0, right: 50.0, top: 10.0, bottom: 10.0),
                      textColor: whiteColor,
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
