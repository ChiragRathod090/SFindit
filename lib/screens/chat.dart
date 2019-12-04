import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sfindit/Model/getPlayersPlayingStatus.dart';
import 'package:sfindit/Model/openTeamChat.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/common/constants.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/keys.dart';
import 'package:sfindit/common/loding.dart';
import 'package:sfindit/common/string.dart';
import 'package:sfindit/rest/api_services.dart';
import 'package:sfindit/utils/appbar.dart';

class Chat extends StatefulWidget {
  final String teamId;

  const Chat({Key key, this.teamId}) : super(key: key);

  @override
  _ChatState createState() => _ChatState(teamId);
}

class _ChatState extends State<Chat> {
  final String teamId;
  String text;

  TextEditingController _messageController = new TextEditingController();

  OpenTeamChat openTeamChatResponse;
  List<Message> chatList;
  UpcomingMatch upcomingMatchData;

  _ChatState(this.teamId);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openTeamChatApi();
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
                openTeamChatResponse == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : checkListIsNullAndBlank(chatList)
                        ? ListView.builder(
                            reverse: true,
                            padding: EdgeInsets.only(top: 12.0, bottom: 16.0),
                            itemCount: chatList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return chatList[index].sameUser == 1
                                  ? rightSideView(chatList[index])
                                  : leftSideView(chatList[index]);
                            },
                          )
                        : Container(
                            margin: EdgeInsets.all(40.0),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(40.0),
                                child: Text(
                                  'write message and hit send to start chat',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(
                                          color: blackColor, fontSize: 16.0),
                                ),
                              ),
                            ),
                          ),
                upcomingMatchData != null
                    ? upcomingMatchPopUp(upcomingMatchData)
                    : Container(),
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
                    controller: _messageController,
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
                    if (text != null) if (text.length != 0) sendMessageApi();
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

  Widget rightSideView(final Message list) {
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
                child: Text(
                  checkBlank(list.message),
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(color: whiteColor),
                ),
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
                child: checkBlank(list.profilePic) != ""
                    ? Image.network(
                        list.profilePic,
                        height: 40.0,
                        width: 40.0,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        Images.LOGO_TRANSPARENT,
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

  Widget leftSideView(final Message list) {
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
                child: checkBlank(list.profilePic) != ""
                    ? Image.network(
                        list.profilePic,
                        height: 40.0,
                        width: 40.0,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        height: 40.0,
                        width: 40.0,
                        color: primaryColor,
                        child: Image.asset(
                          Images.LOGO_TRANSPARENT,
                          fit: BoxFit.cover,
                        ),
                      )),
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
                      list.name,
                      style: Theme.of(context)
                          .textTheme
                          .body1
                          .copyWith(fontSize: 12.0, color: Colors.grey[500]),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(list.message,
                        style: Theme.of(context).textTheme.body1),
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

  Widget upcomingMatchPopUp(UpcomingMatch list) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 10.0),
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
                            'Upcoming Match \nvs. ' + list.oponentName,
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .body2
                                .copyWith(fontSize: 16.0, color: blackColor),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                list.datestamp,
                                style: Theme.of(context)
                                    .textTheme
                                    .body1
                                    .copyWith(
                                        fontSize: 12.0,
                                        color: Colors.grey[600]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  list.overwrite,
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(
                                          fontSize: 12.0,
                                          color: Colors.grey[600]),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        getPlayerPlayingStatusApi();
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
                  style: Theme.of(context)
                      .textTheme
                      .body2
                      .copyWith(fontSize: 16.0, color: blackColor),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 2.4,
                    child: RaisedButton(
                      color:
                          list.playStatus == 1 ? greenColor : Colors.grey[500],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Text(
                        txtPlaying,
                        style: Theme.of(context).textTheme.body1.copyWith(
                            fontSize: 14.0,
                            color: list.playStatus == 1
                                ? whiteColor
                                : Colors.black54),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.4,
                    child: RaisedButton(
                      color:
                          list.playStatus == 2 ? Colors.red : Colors.grey[500],
                      textColor: Colors.black54,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Text(
                        txtUnavailable,
                        style: Theme.of(context).textTheme.body1.copyWith(
                            fontSize: 14.0,
                            color: list.playStatus == 2
                                ? whiteColor
                                : Colors.black54),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openTeamChatApi() async {
    //await showDialog(context: context, builder: (context) => Loading());
    await openTeamChat(getParametersForGetChat()).then((response) {
      var data = json.decode(response.body);
      printResponse(getParametersForGetChat(), data.toString());
      openTeamChatResponse = OpenTeamChat.fromMap(data);
      chatList = openTeamChatResponse.result.messages;
      upcomingMatchData = openTeamChatResponse.result.upcomingMatch;
      setState(() {});
    });
  }

  void getPlayerPlayingStatusApi() {
    showDialog(context: context, builder: (context) => Loading());
    getPlayerPlayingStatus(getParametersForGetPlayerPlayingStatus())
        .then((response) {
      var data = json.decode(response.body);
      printResponse(getParametersForGetPlayerPlayingStatus(), data.toString());
//      GetPlayersPlayingStatus getPlayersPlayingStatus = data;
//      List<Playingstatus> playingStatusList =
//          getPlayersPlayingStatus.playingstatus;
      Navigator.pop(context);

      showDialog(
        context: context,
        builder: (BuildContext context) =>
            CustomDialog(data, upcomingMatchData),
      );
      setState(() {});
    });
  }

  void sendMessageApi() async {
    //await showDialog(context: context, builder: (context) => Loading());
    await sendMessage(getParametersForSendMessage()).then((response) {
      var data = json.decode(response.body);
      printResponse(getParametersForSendMessage(), data.toString());
      if (data['success'] == 1) {
        _messageController.text = "";
        openTeamChatApi();
      } else {}
      setState(() {});
    });
  }

  getParametersForGetChat() {
    String param =
        "&team_id=" + teamId + "&user_id=" + getPrefValue(Keys.USER_ID);
    return param;
  }

  getParametersForSendMessage() {
    String param = "&team_id=" +
        teamId +
        "&user_id=" +
        getPrefValue(Keys.USER_ID) +
        "&message=" +
        text;
    return param;
  }

  getParametersForGetPlayerPlayingStatus() {
    String param = "&user_id=" +
        getPrefValue(Keys.USER_ID) +
        "&match_id=" +
        upcomingMatchData.matchId +
        "&team_id=" +
        teamId;
    return param;
  }
}

class CustomDialog extends StatelessWidget {
  GetPlayersPlayingStatus data;
  UpcomingMatch upcomingMatchData;

  CustomDialog(this.data, this.upcomingMatchData);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: dialogContent(context, data, upcomingMatchData),
    );
  }

  dialogContent(BuildContext context, GetPlayersPlayingStatus data,
      UpcomingMatch upcomingMatchData) {
    return Container(
      decoration: BoxDecoration(
          color: whiteColor,
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
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            child: Text(
              upcomingMatchData.datestamp,
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(fontSize: 14.0, color: Colors.grey[500]),
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: data.playingstatus.length,
              itemBuilder: (BuildContext context, int index) {
                return listItem(context, data.playingstatus[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(BuildContext context, Playingstatus playingStatus) {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: new ClipRRect(
              borderRadius: new BorderRadius.circular(50.0),
              /*                child: checkBlank(list.profilePic) != ""
                    ? Image.network(
                  list.profilePic,
                  height: 40.0,
                  width: 40.0,
                  fit: BoxFit.cover,
                )
                    : Image.asset(
                  Images.LOGO_TRANSPARENT,
                  height: 40.0,
                  width: 40.0,
                  fit: BoxFit.cover,
                ),*/
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
                      playingStatus.name,
                      style: Theme.of(context)
                          .textTheme
                          .body2
                          .copyWith(color: blackColor, fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  playingStatus.playStatus.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(fontSize: 14.0, color: greenColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
