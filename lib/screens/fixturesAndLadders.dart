import 'package:flutter/material.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/string.dart';
import 'package:sfindit/utils/appbar.dart';

class FixtureAndLaddersScreen extends StatefulWidget {
  @override
  _FixtureAndLaddersScreenState createState() =>
      _FixtureAndLaddersScreenState();
}

class _FixtureAndLaddersScreenState extends State<FixtureAndLaddersScreen> {
  bool isSelected = true;
  List<String> list = <String>[
    'SFindit Cruisers',
    'B',
    'C',
    'D',
    'E',
    'F',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      showDialog(
          context: context, builder: (BuildContext context) => CustomDialog());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(txtFixturesAndLadders, false),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = true;
                      });
                    },
                    child: Container(
                        color: isSelected ? Colors.grey[200] : whiteColor,
                        height: 60.0,
                        width: MediaQuery.of(context).size.width / 2,
                        child: Center(
                          child: Text(
                            txtFixtures,
                            style: Theme.of(context)
                                .textTheme
                                .body1
                                .copyWith(fontSize: 16.0),
                          ),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = false;
                      });
                    },
                    child: Container(
                        color: isSelected ? whiteColor : Colors.grey[200],
                        height: 60.0,
                        width: MediaQuery.of(context).size.width / 2,
                        child: Center(
                          child: Text(
                            txtLadders,
                            style: Theme.of(context)
                                .textTheme
                                .body1
                                .copyWith(fontSize: 16.0),
                          ),
                        )),
                  )
                ],
              ),
              isSelected ? fixturesLayout() : laddersLayout()
            ],
          ),
          Image.asset(
            Images.APPBAR_HEADER,
          ),
        ],
      ),
    );
  }

  Widget fixturesLayout() {
    return Expanded(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.grey[400],
            height: 30.0,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: DropdownButton<String>(
              value: "SFindit Cruisers",
              icon: Icon(Icons.keyboard_arrow_down),
              iconSize: 24,
              elevation: 16,
              style:
                  Theme.of(context).textTheme.body1.copyWith(color: blackColor),
              items: list.map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: list.length,
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  fixturesItem(list[index], context),
            ),
          ),
        ],
      ),
    );
  }

  Widget laddersLayout() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 30.0, bottom: 10.0, right: 10.0, left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('SFindit Flyers',
                      style: Theme.of(context)
                          .textTheme
                          .body2
                          .copyWith(fontSize: 17.0)),
                  Text(
                    '100%',
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(fontSize: 12.0, color: blackColor),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              height: 50.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) =>
                    laddersItem(list[index], context),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('SFindit Cruisers',
                                style: Theme.of(context)
                                    .textTheme
                                    .body2
                                    .copyWith(fontSize: 16.0)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('63.64%',
                                style: Theme.of(context)
                                    .textTheme
                                    .body1
                                    .copyWith(
                                        fontSize: 12.0,
                                        color: Colors.grey[600])),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget fixturesItem(String list, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          list,
          style: Theme.of(context).textTheme.body2.copyWith(fontSize: 16.0),
        ),
        SizedBox(
          height: 2.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    "RND-R1",
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(fontSize: 14.0, color: Colors.grey[600]),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    "Venue - Brunkswick",
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(fontSize: 12.0, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.0),
              alignment: Alignment.center,
              child: Text("5 - 0"),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Aug 15\n7:50 PM",
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(fontSize: 12.0, color: Colors.grey[600]),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget laddersItem(String leaderList, BuildContext context) {
  return Container(
    width: 60.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          width: 59.0,
          height: 60.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'E',
                style: Theme.of(context)
                    .textTheme
                    .body1
                    .copyWith(color: Colors.grey[600]),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                '11',
                style: Theme.of(context)
                    .textTheme
                    .body1
                    .copyWith(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.grey[400],
          width: 1.0,
        ),
      ],
    ),
  );
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: whiteColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 10, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  txtSelectTeam,
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(fontSize: 20.0, color: blackColor),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image(
                    image: AssetImage(Images.CLOSE),
                    height: 16.0,
                    width: 16.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return listItem(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        'SFindit Cruisers',
        style: Theme.of(context)
            .textTheme
            .body1
            .copyWith(fontSize: 16.0, color: blackColor),
      ),
    );
  }
}
