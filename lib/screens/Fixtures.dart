import 'package:flutter/material.dart';

class Fixtures extends StatefulWidget {
  @override
  _FixturesState createState() => _FixturesState();
}

class _FixturesState extends State<Fixtures> {
  @override
  Widget build(BuildContext context) {
    return Container();
    /*Scaffold(
      body: Column(
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
                          },
                        )
                      : Container()
                  : Container()),
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
  }*/
  }
}
