import 'package:flutter/material.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/string.dart';
import 'package:sfindit/utils/appbar.dart';

import 'chat.dart';

class TeamsScreen extends StatefulWidget {
  @override
  _TeamsScreenState createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
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
                    Text('SFindit Flyers',
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
                        Text('09',
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
