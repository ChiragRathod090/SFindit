import 'package:flutter/material.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/string.dart';
import 'package:sfindit/utils/appbar.dart';

class SeasonScreen extends StatefulWidget {
  @override
  _SeasonScreenState createState() => _SeasonScreenState();
}

class _SeasonScreenState extends State<SeasonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(txtSelectSeason, false),
      body: Column(
        children: <Widget>[
          Image.asset(
            Images.APPBAR_HEADER,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  switch (index) {
                    case 0:
                      return listItem(
                          Images.AUTUMN, 'Autumn 2019', autumnColor);
                    case 1:
                      return listItem(
                          Images.SPRING, 'Spring 2019', springColor);
                    case 2:
                      return listItem(
                          Images.SUMMER, 'Summer 2019/2020', summerColor);
                    default:
                      return listItem(
                          Images.AUTUMN, 'Autumn 2019', autumnColor);
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget listItem(String imagePath, String name, Color color) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Container(
          color: color,
          height: 165,
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image(
                image: AssetImage(imagePath),
                height: 110.0,
                width: 110.0,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style: TextStyle(color: blackColor, fontSize: 18),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
