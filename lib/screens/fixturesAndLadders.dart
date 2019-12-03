import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sfindit/Model/teamsList.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/common/constants.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/keys.dart';
import 'package:sfindit/common/loding.dart';
import 'package:sfindit/common/string.dart';
import 'package:sfindit/rest/api_services.dart';
import 'package:sfindit/utils/appbar.dart';

class FixtureAndLaddersScreen extends StatefulWidget {
  @override
  _FixtureAndLaddersScreenState createState() =>
      _FixtureAndLaddersScreenState();
}

class _FixtureAndLaddersScreenState extends State<FixtureAndLaddersScreen> {
  bool isSelected = true;

  GetTeamsList teamsListResponse;
  List<Result> teamsList;
  Result teamData;

  var ladderList;
  var fixturesList;

  @override
  void initState() {
    super.initState();
    getTeamsListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(txtFixturesAndLadders, false),
      body: Stack(
        children: <Widget>[
          ladderList != null
              ? Column(
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
                )
              : Container(
                  child: Center(child: CircularProgressIndicator()),
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
              child: teamsListResponse != null
                  ? teamsList.length > 0
                      ? DropdownButton<Result>(
                          hint: Text(txtSelectTeam),
                          value: teamData,
                          icon: Icon(Icons.keyboard_arrow_down),
                          iconSize: 24,
                          elevation: 16,
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .copyWith(color: blackColor),
                          items: teamsList.map((Result value) {
                            return new DropdownMenuItem<Result>(
                              value: value,
                              child: new Text(value.teamName),
                            );
                          }).toList(),
                          onChanged: (Result result) {
                            setState(() {
                              teamData = result;
                            });
                            getLaddersFixturesApi(teamData.teamId, true);
                          },
                        )
                      : Container()
                  : Container()),
          Expanded(
              child: fixturesList != null
                  ? fixturesList.length > 0
                      ? ListView.builder(
                          padding: EdgeInsets.all(10.0),
                          itemCount: fixturesList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              fixturesItem(context, fixturesList, index),
                        )
                      : noDataFound()
                  : noDataFound()),
        ],
      ),
    );
  }

  Widget noDataFound() {
    return Container(
      child: Center(child: Text(txtNoDataFound)),
    );
  }

  Widget laddersLayout() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: checkListIsNullAndBlank(ladderList)
                  ? ListView.builder(
                      itemCount: ladderList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Theme(
                              child: ExpansionTile(
                                initiallyExpanded: index == 0 ? true : false,
                                trailing: Container(
                                  child: Text(''),
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(ladderList[index]['team_name'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .body2
                                            .copyWith(fontSize: 16.0)),
                                    Text(ladderList[index]['m%'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .body1
                                            .copyWith(
                                                fontSize: 14.0,
                                                color: Colors.grey[600])),
                                  ],
                                ),
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Divider(
                                        color: Colors.grey[400],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          blocks("W", ladderList[index]['win'],
                                              true),
                                          blocks("L", ladderList[index]['loss'],
                                              true),
                                          blocks("D", ladderList[index]['draw'],
                                              true),
                                          blocks(
                                              "F",
                                              ladderList[index]['forfeited'],
                                              true),
                                          blocks("G%", ladderList[index]['g%'],
                                              true),
                                          blocks("M%", ladderList[index]['m%'],
                                              false),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                            ),
                          ),
                        );
                      },
                    )
                  : noDataFound(),
            )
          ],
        ),
      ),
    );
  }

  Widget blocks(name, value, isShowDivider) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width / 7,
          height: 60.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                name,
                style: Theme.of(context)
                    .textTheme
                    .body1
                    .copyWith(color: Colors.grey[600]),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                value,
                style: Theme.of(context)
                    .textTheme
                    .body1
                    .copyWith(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        isShowDivider
            ? Container(
                child: Text(""),
                width: 1.0,
                height: 50.0,
                color: Colors.grey[400],
              )
            : Container()
      ],
    );
  }

  void getTeamsListApi() async {
    await getTeamsList(getPrefValue(Keys.USER_ID)).then((response) {
      print(json.decode(response.body));
      setState(() {
        teamsListResponse = GetTeamsList.fromMap(json.decode(response.body));
        teamsList = teamsListResponse.result;
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                SelectTeamDialog(teamsList, (Result data) {
                  setState(() {
                    teamData = data;
                    getLaddersFixturesApi(teamData.teamId, false);
                  });
                }));
      });
    });
  }

  getLaddersFixturesApi(String teamId, bool isLoading) {
    if (isLoading)
      showDialog(context: context, builder: (context) => Loading());
    getLaddersFixtures(teamId).then((response) {
      var data = json.decode(response.body);
      printResponse(teamId, data.toString());
      if (isLoading) Navigator.pop(context);
      if (data['success'] == 1) {
        setState(() {
          ladderList = data['result']['ladderData'];
          fixturesList = data['result']['fixtureData'];
        });
      } else {
        dialog(data['message'].toString(), context);
      }
    });
  }
}

Widget fixturesItem(context, final fixturesList, index) {
  String teamName = checkBlank(fixturesList[index]['opponent_name']);
  String roundNumber = "RND-" + checkBlank(fixturesList[index]['round_number']);
  String venueName = checkBlank(fixturesList[index]['venue_name']);
  String winLoss = checkBlank(fixturesList[index]['home']) +
      " - " +
      checkBlank(fixturesList[index]['away']);
  String dateTime = checkBlank(fixturesList[index]['match_date']) +
      "\n" +
      checkBlank(fixturesList[index]['match_time']);
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          teamName,
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
                    roundNumber,
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(fontSize: 14.0, color: Colors.grey[600]),
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    venueName,
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
              child: Text(winLoss),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    dateTime,
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

class SelectTeamDialog extends StatefulWidget {
  final List<Result> teamsList;
  final Null Function(Result data) param2;

  SelectTeamDialog(this.teamsList, this.param2);

  @override
  _SelectTeamDialogState createState() => _SelectTeamDialogState();
}

class _SelectTeamDialogState extends State<SelectTeamDialog> {
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
              itemCount: widget.teamsList.length,
              itemBuilder: (BuildContext context, int index) {
                return listItem(
                    context, widget.teamsList, index, widget.param2);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(BuildContext context, List<Result> teamsList, int index,
      Null Function(Result data) param2) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        setPrefValue(Keys.TEAM_ID, teamsList[index].teamId);
        setPrefValue(Keys.TEAM_NAME, teamsList[index].teamName);
        param2(teamsList[index]);
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          teamsList[index].teamName,
          style: Theme.of(context)
              .textTheme
              .body1
              .copyWith(fontSize: 16.0, color: blackColor),
        ),
      ),
    );
  }
}
