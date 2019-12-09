import 'package:flutter/material.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/common/constants.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/string.dart';
import 'package:sfindit/screens/fixturesAndLadders.dart';
import 'package:sfindit/screens/liveSupport.dart';
import 'package:sfindit/screens/noInternetConnection.dart';
import 'package:sfindit/screens/notifications.dart';
import 'package:sfindit/screens/profile.dart';
import 'package:sfindit/screens/season.dart';
import 'package:sfindit/screens/teams.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HomeModel> list = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
