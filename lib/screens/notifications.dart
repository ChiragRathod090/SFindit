import 'package:flutter/material.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/string.dart';
import 'package:sfindit/utils/appbar.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: Appbar(txtNotification, false),
      body: Column(
        children: <Widget>[
          Image.asset(
            Images.APPBAR_HEADER,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return listItem();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.grey[200],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new ClipRRect(
                    borderRadius: new BorderRadius.circular(50.0),
                    child: Image.asset(
                      "assets/images/jocker.jpg",
                      height: 62.0,
                      width: 62.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Andrew Scotch',
                              style: Theme.of(context)
                                  .textTheme
                                  .body2
                                  .copyWith(fontSize: 16.0, color: blackColor)),
//                            style: TextStyle(
//                                color: blackColor,
//                                fontSize: 16.0,
//                                fontWeight: FontWeight.bold)),
                          Text("18/09/2018",
                              style: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .copyWith(fontSize: 13.0)),
                          //style: TextStyle(fontSize: 13)),
                        ],
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text('Lorem ipsum doler sit amet this is a dummy text.',
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .copyWith(fontSize: 14.0)),
                      //style: TextStyle(fontSize: 14))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
