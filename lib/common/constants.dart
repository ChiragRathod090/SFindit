import 'package:flutter/material.dart';
import 'package:sfindit/common/pref.dart';

import 'custom_dialog.dart';

const int selectTeamDropDownPosition = 0;

getPrefValue(String key) {
  return Pref.getString(key, "");
}

String getToken(String key) {
  return "Bearer " + Pref.getString(key, "");
}

setPrefValue(key, value) {
  Pref.setString(key, value);
}

void dialog(String msg, BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => CustomDialog(
            msg: msg,
            callBack: () {
              Navigator.pop(context);
            },
          ));
}
