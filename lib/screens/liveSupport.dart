import 'package:flutter/material.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/string.dart';
import 'package:sfindit/utils/appbar.dart';

class LiveSupportScreen extends StatefulWidget {
  @override
  _LiveSupportScreenState createState() => _LiveSupportScreenState();
}

class _LiveSupportScreenState extends State<LiveSupportScreen> {
  List<String> list = new List();
  String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(txtLiveSupport, false),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.only(top: 12.0, bottom: 16.0),
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return (index % 2) != 0 ? leftSideView() : rightSideView();
                  },
                ),
                Image.asset(
                  Images.APPBAR_HEADER,
                )
              ],
            ),
          ),
          _buildTextComposer(context)
        ],
      ),
    );
  }

  Widget _buildTextComposer(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8.0),
      child: Column(
        children: <Widget>[
          Divider(),
          Row(
            children: <Widget>[
              new Flexible(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.grey[200]),
                  child: new TextField(
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.done,
                    onChanged: (String text) {
                      this.text = text;
                    },
                    decoration: new InputDecoration.collapsed(
                        hintText: hintWriteMessage),
                  ),
                ),
              ),
              new Container(
                margin: EdgeInsets.only(right: 8.0, left: 8.0),
                padding: EdgeInsets.all(11.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.grey[200]),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (text != null) if (text.length != 0) list.add(text);
                    });
                  },
                  child: Icon(
                    Icons.send,
                    size: 20.0,
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget rightSideView() {
    return Container(
      margin: EdgeInsets.only(left: 40.0, right: 14.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Card(
              color: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(text,
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(color: whiteColor)),
              ),
              margin: EdgeInsets.only(top: 6.0, bottom: 6.0),
            ),
          ),
          SizedBox(
            width: 12.0,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: CircleAvatar(
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(50.0),
                child: Image.asset(
                  "assets/images/jocker.jpg",
                  height: 40.0,
                  width: 40.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget leftSideView() {
    return Container(
      margin: EdgeInsets.only(left: 14.0, right: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: ClipRRect(
              borderRadius: new BorderRadius.circular(50.0),
              child: Container(
                height: 40.0,
                width: 40.0,
                color: primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    Images.LOGO_TRANSPARENT,
                    height: 40.0,
                    width: 40.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Card(
              color: Colors.grey[100],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Support",
                      style: Theme.of(context)
                          .textTheme
                          .body1
                          .copyWith(fontSize: 12.0, color: Colors.grey[500]),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(text, style: Theme.of(context).textTheme.body1),
                  ],
                ),
              ),
              margin: EdgeInsets.only(top: 6.0, bottom: 6.0),
            ),
          ),
        ],
      ),
    );
  }
}
