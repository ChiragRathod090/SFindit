import 'package:flutter/material.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/utils/appbar.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      body: Container(
        color: primaryColor,
      ),
    );
  }
}
