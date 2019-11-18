import 'package:flutter/material.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/screens/editProfile.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  bool isProfileEdit = false;

  Appbar(this.title, this.isProfileEdit);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      title: Text(title),
      actions: <Widget>[
        isProfileEdit
            ? GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Image.asset(
                    Images.EDIT,
                    height: 16.0,
                    width: 16.0,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
