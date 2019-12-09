import 'package:flutter/material.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/common/string.dart';

class NoInternetConnection extends StatefulWidget {
  @override
  _NoInternetConnectionState createState() => _NoInternetConnectionState();
}

class _NoInternetConnectionState extends State<NoInternetConnection> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent, child: dialogContent(context));
  }

  dialogContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: Column(
        children: <Widget>[
          Text(txtInternetConnection),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              RaisedButton(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Text(
                  txtTryAgain,
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(fontSize: 14.0, color: whiteColor),
                ),
                onPressed: () {
                  setState(() {});
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
