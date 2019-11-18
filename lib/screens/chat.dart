import 'package:flutter/material.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/string.dart';
import 'package:sfindit/utils/appbar.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<String> list = new List();

  String text;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar('SFindit Flyers', false),
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
                upcomingMatchPopUp(),
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
                      list.add(text);
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
              //color: Colors.white,
              color: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(text,
                    //style: Theme.of(context).textTheme.body1),
                    style: TextStyle(color: whiteColor)),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        Text(
//                          "You",
//                          style: Theme.of(context).textTheme.body1.copyWith(
//                              fontSize: 12.0,
//                              color: whiteColor /*Colors.grey[400]*/),
//                        ),
//                        Icon(
//                          Icons.visibility,
//                          color: Colors.grey[300],
//                          size: 12.0,
//                        )
//                      ],
//                    ),
//                    SizedBox(
//                      height: 4.0,
//                    ),
//                    Text(
//                        "With decades of industry leadership, Loram is a recognized pioneer in maintenance of way services and equipment for the railroad industry.",
//                        //style: Theme.of(context).textTheme.body1),
//                        style: TextStyle(color: whiteColor)),
//                  ],
//                ),
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
              child: Image.asset(
                "assets/images/jocker.jpg",
                height: 40.0,
                width: 40.0,
                fit: BoxFit.cover,
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
                      "Man Moore",
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

  Widget upcomingMatchPopUp() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      height: MediaQuery.of(context).size.height * 0.30,
      alignment: Alignment.topCenter,
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Upcoming Match \n vs. All That Talent',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: blackColor,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: <Widget>[
                            Text('07/10/2019',
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 12)),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text('7:10 PM',
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 12)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomDialog(),
                      );
                    },
                    child: Image(
                      image: AssetImage(Images.INFO),
                      color: orangeColor,
                      height: 20.0,
                      width: 20.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Are you available?',
                style: TextStyle(
                    color: blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  color: greenColor,
                  textColor: whiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Text(txtPlaying, style: TextStyle(fontSize: 14)),
                  padding: EdgeInsets.only(left: 50.0, right: 50.0),
                  onPressed: () {},
                ),
                RaisedButton(
                  color: Colors.grey[500],
                  textColor: Colors.black54,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Text(txtUnavailable, style: TextStyle(fontSize: 14)),
                  padding: EdgeInsets.only(left: 50.0, right: 50.0),
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
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
          border: Border.all(width: 1),
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 10, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  txtUpcomingMatch,
                  style: TextStyle(fontSize: 20, color: blackColor),
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
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            child: Text(
              '07/10/2019',
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
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
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: new ClipRRect(
              borderRadius: new BorderRadius.circular(50.0),
              child: Image.asset(
                "assets/images/jocker.jpg",
                height: 55.0,
                width: 55.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Andrew Scotch',
                      style: TextStyle(
                          color: blackColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  'Playing',
                  style: TextStyle(fontSize: 14, color: greenColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
