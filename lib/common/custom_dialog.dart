import 'package:flutter/material.dart';
import 'package:sfindit/common/string.dart';

class CustomDialog extends StatelessWidget {
  final String msg;
  final Null Function() callBack;

  CustomDialog({this.msg, this.callBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 32.0, right: 32.0),
      alignment: Alignment.center,
      child: Card(
        elevation: 2.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              child: Text(
                msg,
                textAlign: TextAlign.start,
                style:
                    Theme.of(context).textTheme.body1.copyWith(fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                child: Text(
                  txtOk,
                  style: Theme.of(context).textTheme.body2,
                ),
                onPressed: () {
                  if (callBack == null)
                    Navigator.pop(context);
                  else {
                    Navigator.pop(context);
                    callBack();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomDialogYesNo extends StatelessWidget {
  final String msg;
  final Null Function() yesCallBack;
  final Null Function() noCallBack;

  CustomDialogYesNo(
      {@required this.msg, @required this.yesCallBack, this.noCallBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 32.0, right: 32.0),
      alignment: Alignment.center,
      child: Card(
        elevation: 2.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              child: Text(
                msg,
                textAlign: TextAlign.start,
                style:
                    Theme.of(context).textTheme.body1.copyWith(fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      txtYes,
                      style: Theme.of(context).textTheme.body2,
                    ),
                    onPressed: () {
                      yesCallBack();
                    },
                  ),
                  FlatButton(
                    child: Text(
                      txtNo,
                      style: Theme.of(context).textTheme.body2,
                    ),
                    onPressed: () {
                      if (noCallBack == null)
                        Navigator.of(context).pop();
                      else
                        noCallBack();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> showAlertDialog(
        {BuildContext context, String title, String description}) =>
    showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
              title: Text(title),
              content: SingleChildScrollView(
                child: Text(description),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));

class SelectPhotoDialog extends StatelessWidget {
  final Null Function() callCamera;
  final Null Function() callPhoto;

  SelectPhotoDialog({@required this.callCamera, @required this.callPhoto});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: 32.0, right: 32.0),
      alignment: Alignment.center,
      child: Card(
        elevation: 2.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: width / 1.5,
                  child: Center(
                    child: Text(
                      txtSelectImage,
                      style: Theme.of(context)
                          .textTheme
                          .body2
                          .copyWith(fontSize: 18.0),
                    ),
                  )),
            ),
            Divider(),
            SizedBox(
              width: width / 1.5,
              child: FlatButton(
                onPressed: () {
                  callCamera();
                  Navigator.pop(context);
                },
                child: Text(
                  txtCamera,
                  style: Theme.of(context).textTheme.body2,
                ),
              ),
            ),
            SizedBox(
              width: width / 1.5,
              child: FlatButton(
                onPressed: () {
                  callPhoto();
                  Navigator.pop(context);
                },
                child: Text(
                  txtGallery,
                  style: Theme.of(context).textTheme.body2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
