import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/common/constants.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/keys.dart';
import 'package:sfindit/common/string.dart';
import 'package:sfindit/rest/api_services.dart';
import 'package:sfindit/screens/fixturesAndLadders.dart';
import 'package:sfindit/screens/liveSupport.dart';
import 'package:sfindit/screens/noInternetConnection.dart';
import 'package:sfindit/screens/notifications.dart';
import 'package:sfindit/screens/profile.dart';
import 'package:sfindit/screens/season.dart';
import 'package:sfindit/screens/teams.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HomeModel> list = new List();

  int unreadMessagesFlag = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getAppVersionApi();
    });
    getMessageUnreadFlagApi();
    addItemsToHome();
    checkConnection().then((isConnected) {
      print("checkConnection(){...}");
      if (!isConnected) {
        print("!isConnected");
        NoInternetConnection();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new RoundedAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
              ),
              delegate: SliverChildBuilderDelegate(
                  (context, index) => listItem(context, index),
                  childCount: list.length),
            )
          ],
        ));
  }

  Widget listItem(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          switch (index) {
            case 0:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
              break;
            case 1:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationScreen()));
              break;
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TeamsScreen()));
              break;
            case 3:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FixtureAndLaddersScreen()));
              break;
            case 4:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SeasonScreen()));
              break;
            case 5:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LiveSupportScreen()));
              break;
            default:
              break;
          }
        },
        child: Column(
          children: <Widget>[
            index == 2
                ? unreadMessagesFlag == 1
                    ? Container(
                        padding: EdgeInsets.all(2.0),
                        alignment: Alignment.topRight,
                        child: Card(
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          elevation: 5.0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              txtNew,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 10.0, color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    : Container()
                : Container(),
            Image(
              height: 100,
              width: 100,
              image: AssetImage(list[index].img),
            ),
            Expanded(
              child: Text(
                list[index].title,
                style:
                    Theme.of(context).textTheme.body1.copyWith(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addItemsToHome() {
    list.add(HomeModel(txtProfile, Images.HOME_PROFILE));
    list.add(HomeModel(txtNotifications, Images.HOME_NOTIFICATION));
    list.add(HomeModel(txtTeams, Images.HOME_TEAMS));
    list.add(HomeModel(txtFixturesAndLadders, Images.HOME_FIXTURE));
    list.add(HomeModel(txtInvoices, Images.HOME_DOCUMENT));
    list.add(HomeModel(txtLiveSupport, Images.HOME_LIVE_SUPPORT));
  }

  void getAppVersionApi() async {
    await getVersions().then((response) {
      print(json.decode(response.body));
      var data = json.decode(response.body);

      if (data['success'] == 1) {
        print("ANDROID_VERSION : " + data['result']['android']);
        print("IOS_VERSION : " + data['result']['ios']);

        if (checkBlank(getPrefValue(Keys.ANDROID_VERSION)) == "") {
          print("ANDROID_VERSION == \"\"");
          setPrefValue(Keys.ANDROID_VERSION, "1.0");
          setPrefValue(Keys.IOS_VERSION, "1.0");
        }

        if (checkBlank(getPrefValue(Keys.IOS_VERSION)) == "") {
          print("IOS_VERSION == \"\"");
          setPrefValue(Keys.ANDROID_VERSION, "1.0");
          setPrefValue(Keys.IOS_VERSION, "1.0");
        }

        if (Platform.isAndroid) {
          print("Platform : Android");
          if (data['result']['android'] != getPrefValue(Keys.ANDROID_VERSION)) {
            print("Show App Update PopUp");
            showAppUpdatePopup(data,
                "https://play.google.com/store/apps/details?id=com.supercell.clashofclans&hl=en");
          }
        } else if (Platform.isIOS) {
          print("Platform : IOS");
          if (data['result']['ios'] != getPrefValue(Keys.IOS_VERSION)) {
            print("Show App Update PopUp");
            showAppUpdatePopup(data,
                "https://play.google.com/store/apps/details?id=io.voodoo.crowdcity&hl=en");
          }
        }
      }
    });
  }

  void getMessageUnreadFlagApi() async {
    await getMessageUnreadFlag(getPrefValue(Keys.USER_ID)).then((response) {
      print(json.decode(response.body));
      var data = json.decode(response.body);
      unreadMessagesFlag = data['result']['un_read_flag'];
      setState(() {});
    });
  }

  void showAppUpdatePopup(data, link) {
    setPrefValue(Keys.ANDROID_VERSION, data['result']['android']);
    setPrefValue(Keys.IOS_VERSION, data['result']['ios']);
    _showDialog(link);
  }

  void _showDialog(link) {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Update Available"),
          content: new Text(
              "Make sure you update your app to recieve the best possible experience!"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
                child: new Text("Update"), onPressed: () => _launchURL(link)),
          ],
        );
      },
    );
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
      Navigator.of(context).pop();
    } else {
      throw 'Could not launch $url';
    }
  }
}

class HomeModel {
  String title;
  String img;

  HomeModel(this.title, this.img);
}

class RoundedAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new SizedBox.fromSize(
          size: preferredSize,
          child: new LayoutBuilder(builder: (context, constraint) {
            final width = constraint.maxWidth * 16;
            return new ClipRect(
              child: new OverflowBox(
                maxHeight: double.infinity,
                maxWidth: double.infinity,
                child: new SizedBox(
                  width: width,
                  height: width,
                  child: new Padding(
                    padding: new EdgeInsets.only(
                        bottom: width / 2 - preferredSize.height / 2),
                    child: new DecoratedBox(
                      decoration: new BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
        Image(
          image: AssetImage(Images.LOGO_TRANSPARENT),
          width: 180.0,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(180.0);
}
