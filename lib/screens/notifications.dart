import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sfindit/Model/getNotifications.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/common/constants.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/keys.dart';
import 'package:sfindit/common/string.dart';
import 'package:sfindit/rest/api_services.dart';
import 'package:sfindit/utils/appbar.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  GetNotifications getNotificationsResponse;
  List<Result> notificationList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotificationsApi();
  }

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
              child: getNotificationsResponse != null
                  ? checkListIsNullAndBlank(notificationList)
                      ? ListView.builder(
                          itemCount: notificationList.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return listItem(notificationList[index]);
                          },
                        )
                      : progressBar()
                  : progressBar()),
        ],
      ),
    );
  }

  Widget progressBar() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget listItem(Result list) {
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
                      child: checkBlank(list.profilePic) != ""
                          ? Image.network(
                              list.profilePic,
                              height: 62.0,
                              width: 62.0,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              height: 62.0,
                              width: 62.0,
                              color: primaryColor,
                              child: Image.asset(
                                Images.LOGO_TRANSPARENT,
                                fit: BoxFit.cover,
                              ),
                            )),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(checkBlank(list.name),
                              style: Theme.of(context)
                                  .textTheme
                                  .body2
                                  .copyWith(fontSize: 16.0, color: blackColor)),
                          Text(list.crtDate,
                              style: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .copyWith(fontSize: 13.0)),
                        ],
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(checkBlank(list.notification),
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .copyWith(fontSize: 14.0)),
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

  void getNotificationsApi() {
    getNotification(getPrefValue(Keys.USER_ID)).then((response) {
      var data = json.decode(response.body);
      printResponse(getPrefValue(Keys.USER_ID), data.toString());
      getNotificationsResponse = GetNotifications.fromMap(data);
      notificationList = getNotificationsResponse.result;
      setState(() {});
    });
  }
}
