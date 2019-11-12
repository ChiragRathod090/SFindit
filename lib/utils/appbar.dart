import 'package:flutter/material.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/string.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(txtProfile),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            Images.EDIT,
            height: 16.0,
            width: 16.0,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
