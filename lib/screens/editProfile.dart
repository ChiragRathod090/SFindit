import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/common/constants.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/input_type_validation.dart';
import 'package:sfindit/common/keys.dart';
import 'package:sfindit/common/loding.dart';
import 'package:sfindit/common/string.dart';
import 'package:sfindit/rest/api_services.dart';
import 'package:sfindit/utils/appbar.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var isValidation = false;

//  TextEditingController _nameController = new TextEditingController();
//  TextEditingController _nickNameController = new TextEditingController();
//  TextEditingController _emailController = new TextEditingController();
//  TextEditingController _phoneNoController = new TextEditingController();
//  TextEditingController _emergencyNameController = new TextEditingController();
//  TextEditingController _emergencyContactController =
//      new TextEditingController();

  FocusNode nameFocusNode,
      nickNameFocusNode,
      emailFocusNode,
      phoneNoFocusNode,
      emergencyNameFocusNode,
      emergencyContactFocusNode;

  String _name,
      _nickName,
      _email,
      _phoneNo,
      _emergencyContactName,
      _emergencyContactNumber;

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
              child: Form(
                key: _formKey,
                autovalidate: isValidation,
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          //controller: _nameController,
                          initialValue: checkBlank(getPrefValue(Keys.NAME)),
                          validator: InputValidation.validateName,
                          onSaved: (val) {
                            _name = val;
                          },
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .copyWith(fontSize: 16.0, color: blackColor),
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          focusNode: nameFocusNode,
                          decoration:
                              InputDecoration.collapsed(hintText: hintName),
                          onFieldSubmitted: (term) {
                            _fieldFocusChange(
                                context, nameFocusNode, nickNameFocusNode);
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          //controller: _nickNameController,
                          initialValue:
                              checkBlank(getPrefValue(Keys.NICK_NAME)),
                          validator: InputValidation.validateNickName,
                          onSaved: (val) {
                            _nickName = val;
                          },
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .copyWith(fontSize: 16.0, color: blackColor),
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          focusNode: nickNameFocusNode,
                          decoration:
                              InputDecoration.collapsed(hintText: hintNickName),
                          onFieldSubmitted: (term) {
                            _fieldFocusChange(
                                context, nickNameFocusNode, emailFocusNode);
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          //controller: _emailController,
                          initialValue: checkBlank(getPrefValue(Keys.EMAIL)),
                          validator: InputValidation.validateEmail,
                          onSaved: (val) {
                            _email = val;
                          },
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .copyWith(fontSize: 16.0, color: blackColor),
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          focusNode: emailFocusNode,
                          decoration:
                              InputDecoration.collapsed(hintText: hintEmail),
                          onFieldSubmitted: (term) {
                            _fieldFocusChange(
                                context, emailFocusNode, phoneNoFocusNode);
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          //controller: _phoneNoController,
                          initialValue: checkBlank(getPrefValue(Keys.MOBILE)),
                          validator: InputValidation.validateMobile,
                          onSaved: (val) {
                            _phoneNo = val;
                          },
                          maxLength: 10,
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .copyWith(fontSize: 16.0, color: blackColor),
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          keyboardType: TextInputType.number,
                          focusNode: phoneNoFocusNode,
                          decoration: InputDecoration.collapsed(
                              hintText: hintPhoneNumber),
                          onFieldSubmitted: (term) {
                            _fieldFocusChange(context, phoneNoFocusNode,
                                emergencyNameFocusNode);
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          //controller: _emergencyNameController,
                          initialValue:
                              checkBlank(getPrefValue(Keys.EMERGENCY_NAME)),
                          validator: InputValidation.validateEmergencyName,
                          onSaved: (val) {
                            _emergencyContactName = val;
                          },
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .copyWith(fontSize: 16.0, color: blackColor),
                          textInputAction: TextInputAction.next,
                          autocorrect: false,
                          focusNode: emergencyNameFocusNode,
                          decoration: InputDecoration.collapsed(
                              hintText: hintEmergencyContactName),
                          onFieldSubmitted: (term) {
                            _fieldFocusChange(context, emergencyNameFocusNode,
                                emergencyContactFocusNode);
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          //controller: _emergencyContactController,
                          initialValue:
                              checkBlank(getPrefValue(Keys.EMERGENCY_CONTACT)),
                          validator:
                              InputValidation.validateEmergencyContactNumber,
                          onSaved: (val) {
                            _emergencyContactNumber = val;
                          },
                          maxLength: 10,
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .copyWith(fontSize: 16.0, color: blackColor),
                          textInputAction: TextInputAction.done,
                          autocorrect: false,
                          keyboardType: TextInputType.number,
                          focusNode: emergencyContactFocusNode,
                          decoration: InputDecoration.collapsed(
                              hintText: hintEmergencyContact),
                          onFieldSubmitted: (term) {},
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        child: Text(
                          txtSave,
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .copyWith(fontSize: 20.0, color: whiteColor),
                        ),
                        color: orangeColor,
                        padding: EdgeInsets.only(
                            left: 50.0, right: 50.0, top: 10.0, bottom: 10.0),
                        textColor: whiteColor,
                        onPressed: () {
                          if (isValidate()) if (isChanged()) editProfileApi();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isChanged() {
    bool isChanged = false;
    if (checkBlank(getPrefValue(Keys.NAME)) != _name) {
      isChanged = true;
    }
    if (checkBlank(getPrefValue(Keys.NICK_NAME)) != _nickName) {
      isChanged = true;
    }
    if (checkBlank(getPrefValue(Keys.EMAIL)) != _email) {
      isChanged = true;
    }
    if (checkBlank(getPrefValue(Keys.MOBILE)) != _phoneNo) {
      isChanged = true;
    }
    if (checkBlank(getPrefValue(Keys.EMERGENCY_NAME)) !=
        _emergencyContactName) {
      isChanged = true;
    }
    if (checkBlank(getPrefValue(Keys.EMERGENCY_CONTACT)) !=
        _emergencyContactNumber) {
      isChanged = true;
    }
    return isChanged;
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

  void editProfileApi() {
    showDialog(context: context, builder: (context) => Loading());
    updateProfile(getParameter()).then((response) {
      Navigator.pop(context);
      var data = json.decode(response.body);
      print(data);
      if (data['success'] == 1) {
        dialog(data['message'].toString(), context);
      } else {
        dialog(data['message'].toString(), context);
      }
      setState(() {});
    });
  }

  String getParameter() {
    return "&name=$_name" +
        "&nickname=$_nickName" +
        "&email=$_email" +
        "&mobile=$_phoneNo" +
        "&emergency_name=$_emergencyContactName" +
        "&emergency_contact=$_emergencyContactNumber" +
        "&user_id=" +
        getPrefValue(Keys.USER_ID);
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
