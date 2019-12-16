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
  List<Datum> notificationList = [];
  Result result;
  ScrollController _scrollController = ScrollController();
  int pageCounter = 1;
  bool noDataFound = false;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_scrollListener);
    getNotificationsApi();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (!isLoading) return;
      setState(() {
        isLoading = false;
        pageCounter = pageCounter + 1;
      });
      getNotificationsApi();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: Appbar(txtNotification, false),
      body: Stack(
        children: <Widget>[
          Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: isLoading
                    ? Container()
                    : SizedBox(
                        height: 35.0,
                        child: CircularProgressIndicator(),
                        width: 35.0,
                      ),
              )),
          getNotificationsResponse == null
              ? Container(
                  child: Center(child: progressBar()),
                )
              : Container(
                  margin:
                      EdgeInsets.only(top: 10.0, bottom: isLoading ? 0 : 35.0),
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: notificationList.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return listItem(notificationList[index]);
                    },
                  ),
                ),
          Image.asset(
            Images.APPBAR_HEADER,
          ),
        ],
      ),
      /*Column(
        children: <Widget>[
          Image.asset(
            Images.APPBAR_HEADER,
          ),
          Stack(
            children: <Widget>[
              getNotificationsResponse != null
                  ? checkListIsNullAndBlank(notificationList)
                      ? ListView.builder(
                          controller: _scrollController,
                          itemCount: notificationList.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return listItem(notificationList[index]);
                          },
                        )
                      : Container(
                          child: Center(
                              child: Text(
                            txtNoDataFound,
                            style: Theme.of(context)
                                .textTheme
                                .body1
                                .copyWith(fontSize: 20.0),
                          )),
                        )
                  : progressBar(),
              Container(
                  alignment: Alignment.bottomCenter,
                  child: isLoading ? Container() : CircularProgressIndicator()),
            ],
          ),
        ],
      ),*/
    );
  }

  Widget progressBar() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget listItem(Datum list) {
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
                      SizedBox(height: 2.0),
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
    getNotification(getParameters()).then((response) {
      //var data = json.decode(response.body);
      print(response.message);
      printResponse(getPrefValue(Keys.USER_ID), response.toString());
      getNotificationsResponse = response;
      result = getNotificationsResponse.result;
      //notificationList = result.data;
      this.notificationList.addAll(result.data);
      if (result.data.length > 10) {
        isLoading = false;
      } else {
        isLoading = true;
      }
      print("onDataArrayListSize:" + notificationList.length.toString());
      setState(() {});
    });
  }

  getParameters() {
    String param = "&user_id=" +
        getPrefValue(Keys.USER_ID) +
        "&pageno=" +
        pageCounter.toString();
    return param;
  }
}
