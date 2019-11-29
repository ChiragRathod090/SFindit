import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sfindit/Model/teamsList.dart';
import 'package:sfindit/common/constants.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/keys.dart';
import 'package:sfindit/common/string.dart';
import 'package:sfindit/rest/api_services.dart';
import 'package:sfindit/utils/appbar.dart';

import 'chat.dart';

class TeamsScreen extends StatefulWidget {
  @override
  _TeamsScreenState createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  GetTeamsList teamsListResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getTeamsListApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: Appbar(txtTeams, false),
      body: Column(
        children: <Widget>[
          Image.asset(
            Images.APPBAR_HEADER,
          ),
          Expanded(
            child: teamsListResponse == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : teamsListResponse.result.length > 0
                    ? ListView.builder(
                        itemCount: teamsListResponse.result.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return listItem(teamsListResponse.result, index);
                        },
                      )
                    : Container(
                        child: Center(child: Text(txtNoDataFound)),
                      ),
          ),
        ],
      ),
    );
  }

  void getTeamsListApi() {
    getTeamsList(getPrefValue(Keys.USER_ID)).then((response) {
      print(json.decode(response.body));
      setState(() {
        teamsListResponse = GetTeamsList.fromMap(json.decode(response.body));
      });
    });
  }

  Widget listItem(List<Result> list, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Chat()));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          color: Colors.grey[200],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(list[index].teamName,
                        style: Theme.of(context)
                            .textTheme
                            .body2
                            .copyWith(fontSize: 16.0)),
                    SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      children: <Widget>[
                        Image(
                          color: Colors.grey[600],
                          image: AssetImage(Images.TEAMS),
                          height: 16.0,
                          width: 16.0,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text(list[index].playerCount,
                            style: Theme.of(context)
                                .textTheme
                                .body1
                                .copyWith(fontSize: 13.0)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
