import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sfindit/Model/seasonList.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/common/custom_dialog.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/string.dart';
import 'package:sfindit/rest/api_services.dart';
import 'package:sfindit/screens/invoice.dart';
import 'package:sfindit/utils/appbar.dart';

class SeasonScreen extends StatefulWidget {
  @override
  _SeasonScreenState createState() => _SeasonScreenState();
}

class Seasons {
  String imagePath;
  String name;
  Color color;

  Seasons(this.imagePath, this.name, this.color);
}

class _SeasonScreenState extends State<SeasonScreen> {
  var list;

  GetSeasonList bgfgfgf;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getSeasonListApi();
    });
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
                child: list == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: list.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return listItem(index);
                        },
                        /*  itemBuilder: (BuildContext context, int index) {
                  return listItem(index);
                },*/
                      )),
          )
        ],
      ),
    );
  }

  Widget listItem(int index) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      InvoiceScreen(title: list[index]['name'] + " invoice")));
        },
        child: Container(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Container(
              decoration: BoxDecoration(
                  //color: list[index].color,
                  color: orangeColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              height: 165.0,
              child: Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image(
                    //image: AssetImage(list[index].imagePath),
                    image: AssetImage(Images.SUMMER),
                    height: 110.0,
                    width: 110.0,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(list[index]['name'],
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontSize: 18.0)),
                  )
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }

  void getSeasonListApi() {
    getSeasonList().then((response) {
      var data = json.decode(response.body);
     bgfgfgf = getSeasonListFromJson(data);
      print(data);
      setState(() {
        list = data['result'];
      });
    });
  }

  void dialog(String msg) {
    showDialog(
        context: context,
        builder: (context) => CustomDialog(
              msg: msg,
              callBack: () {
                Navigator.pop(context);
              },
            ));
  }
}
