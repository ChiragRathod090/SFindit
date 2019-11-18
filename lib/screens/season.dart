import 'package:flutter/material.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/string.dart';
import 'package:sfindit/screens/invoice.dart';
import 'package:sfindit/utils/appbar.dart';

class SeasonScreen extends StatefulWidget {
  @override
  _SeasonScreenState createState() => _SeasonScreenState();
}

class _SeasonScreenState extends State<SeasonScreen> {
  List<Seasons> list = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list.add(Seasons(Images.AUTUMN, 'Autumn 2019', autumnColor));
    list.add(Seasons(Images.SPRING, 'Spring 2019', springColor));
    list.add(Seasons(Images.SUMMER, 'Summer 2019/2020', summerColor));
  }

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
                itemCount: list.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return listItem(index);
//                    case 1:
//                  switch (index) {
//                    case 0:
//                      return listItem(Images.AUTUMN, 'Autumn 2019', autumnColor);
//                    case 1:
//                      return listItem(Images.SPRING, 'Spring 2019', springColor);
//                    case 2:
//                      return listItem(Images.SUMMER, 'Summer 2019/2020', summerColor);
//                    default:
//                      return listItem(Images.AUTUMN, 'Autumn 2019', autumnColor);
//                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }

//  Widget listItem(String imagePath, String name, Color color) {
  Widget listItem(int index) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      InvoiceScreen(title: list[index].name)));
        },
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Container(
            color: list[index].color,
            height: 165,
            child: Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image(
                  image: AssetImage(list[index].imagePath),
                  height: 110.0,
                  width: 110.0,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    list[index].name,
                    style: TextStyle(color: blackColor, fontSize: 18),
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}

class Seasons {
  String imagePath;
  String name;
  Color color;

  Seasons(this.imagePath, this.name, this.color);
}
