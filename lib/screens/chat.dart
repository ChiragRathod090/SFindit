import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
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
  final String teamName;

//const  Chat(this.teamId, this.teamName, { this.teamId,  this.teamName});
  const Chat({Key key, this.teamId, this.teamName}) : super(key: key);

  @override
  _ChatState createState() => _ChatState(teamId, teamName);
}

class _ChatState extends State<Chat> {
  final String teamId;
  final String teamName;
  String text;

  TextEditingController _messageController = new TextEditingController();

  OpenTeamChat openTeamChatResponse;
  List<Message> chatList;
  List<UpcomingMatch> upcomingMatchList;
  UpcomingMatch upcomingMatchData;

  var playingList;
  var latestMessageId;
  Timer timer;

  String playingStatus;

  _ChatState(this.teamId, this.teamName);

  @override
  void initState() {
    super.initState();
    openTeamChatApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(teamName, false),
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
                    if (text != null) if (text.length != 0) {
                      var messageId = int.parse(latestMessageId) + 1;
                      Message message = new Message(
                          messageId: messageId.toString(),
                          teamId: teamId,
                          userId: getPrefValue(Keys.USER_ID),
                          message: text,
                          activeFlag: "1",
                          crtDate: "121641",
                          name: getPrefValue(Keys.NAME),
                          nickname: getPrefValue(Keys.NICK_NAME),
                          profilePic: getPrefValue(Keys.PROFILE_PIC),
                          sameUser: 1);
                      chatList.insert(0, message);
                      _messageController.text = "";
                      timer.cancel();
                      setState(() {});
                      sendMessageApi();
                    }
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
                    : Container(
                        height: 40.0,
                        width: 40.0,
                        color: primaryColor,
                        child: Image.asset(
                          Images.LOGO_TRANSPARENT,
                          fit: BoxFit.cover,
                        ),
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
                  playingStatus == "1"
                      ? Container(
                          width: MediaQuery.of(context).size.width / 2.4,
                          child: RaisedButton(
                            color: greenColor,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            child: Text(
                              txtPlaying,
                              style: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .copyWith(fontSize: 14.0, color: whiteColor),
                            ),
                            onPressed: () {},
                          ),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width / 2.4,
                          child: RaisedButton(
                            color: Colors.grey[500],
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            child: Text(
                              txtPlaying,
                              style: Theme.of(context).textTheme.body1.copyWith(
                                  fontSize: 14.0, color: Colors.black54),
                            ),
                            onPressed: () {
                              setState(() {
                                timer.cancel();
                                addPlayStatusApi(1);
                              });
                            },
                          ),
                        ),
                  playingStatus == "2"
                      ? Container(
                          width: MediaQuery.of(context).size.width / 2.4,
                          child: RaisedButton(
                            color: Colors.red,
                            textColor: Colors.black54,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            child: Text(
                              txtUnavailable,
                              style: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .copyWith(fontSize: 14.0, color: whiteColor),
                            ),
                            onPressed: () {},
                          ),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width / 2.4,
                          child: RaisedButton(
                            color: Colors.grey[500],
                            textColor: Colors.black54,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            child: Text(
                              txtUnavailable,
                              style: Theme.of(context).textTheme.body1.copyWith(
                                  fontSize: 14.0, color: Colors.black54),
                            ),
                            onPressed: () {
                              timer.cancel();
                              addPlayStatusApi(2);
                              setState(() {});
                            },
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

  callLatestMessageApiTimer() {
    timer = Timer.periodic(
        Duration(seconds: 10), (Timer t) => getLatestMessagesApi(false));
  }

  openTeamChatApi() async {
    await openTeamChat(getParametersForGetChat()).then((response) {
      var data = json.decode(response.body);
      printResponse(getParametersForGetChat(), data.toString());
      openTeamChatResponse = OpenTeamChat.fromMap(data);
      chatList = openTeamChatResponse.result.messages;
      upcomingMatchList = openTeamChatResponse.result.upcomingMatch;
      if (chatList.length > 0) {
        latestMessageId = chatList[0].messageId;
      }
      if (upcomingMatchList.length > 0) {
        upcomingMatchData = upcomingMatchList[0];
        playingStatus = upcomingMatchData.playStatus;
      } else {
        upcomingMatchData = null;
      }
      callLatestMessageApiTimer();
      setState(() {});
    });
  }

  getParametersForGetChat() {
    String param =
        "&team_id=" + teamId + "&user_id=" + getPrefValue(Keys.USER_ID);
    return param;
  }

  getLatestMessagesApi(bool isRemove) async {
    getLatestMessages(getParametersForGetLatestMessages()).then((response) {
      var data = json.decode(response.body);
      printResponse(getParametersForGetLatestMessages(), data.toString());
      if (isRemove) chatList.removeAt(0);
      for (var messages in data['result']['messages']) {
        latestMessageId = messages['message_id'];
        Message messageData = new Message(
            messageId: messages['message_id'],
            teamId: messages['team_id'],
            userId: messages['user_id'],
            message: messages['message'],
            activeFlag: messages['active_flag'],
            crtDate: messages['crt_date'],
            name: messages['name'],
            nickname: messages['nickname'],
            profilePic: messages['profile_pic'],
            sameUser: messages['same_user']);
        chatList.insert(0, messageData);
      }
      if (isRemove) callLatestMessageApiTimer();
    });
  }

  getParametersForGetLatestMessages() {
    String param = "&user_id=" +
        getPrefValue(Keys.USER_ID) +
        "&team_id=" +
        teamId +
        "&message_id=" +
        latestMessageId;
    return param;
  }

  getPlayerPlayingStatusApi() {
    showDialog(context: context, builder: (context) => Loading());
    getPlayerPlayingStatus(getParametersForGetPlayerPlayingStatus())
        .then((response) {
      var data = json.decode(response.body);
      printResponse(getParametersForGetPlayerPlayingStatus(), data.toString());
      playingList = data['result'];

      Navigator.pop(context);

      showDialog(
        context: context,
        builder: (BuildContext context) =>
            CustomDialog(playingList, upcomingMatchData),
      );
      setState(() {});
    });
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

  sendMessageApi() async {
    await sendMessage(getParametersForSendMessage()).then((response) {
      var data = json.decode(response.body);
      printResponse(getParametersForSendMessage(), data.toString());
      if (data['success'] == 1) {
        getLatestMessagesApi(true);
      }
      setState(() {});
    });
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

  void addPlayStatusApi(int i) {
    showDialog(context: context, builder: (context) => Loading());
    addPlayStatus(getParametersForAddPlayStatus(i)).then((response) {
      var data = json.decode(response.body);
      printResponse(getParametersForAddPlayStatus(i), data.toString());
      Navigator.pop(context);
      setState(() {
        if (data['success'] == 1) {
          playingStatus = i.toString();
        }
      });
      callLatestMessageApiTimer();
    });
  }

  getParametersForAddPlayStatus(final int i) {
    String param = "&user_id=" +
        getPrefValue(Keys.USER_ID) +
        "&match_id=" +
        upcomingMatchData.matchId +
        "&status=" +
        i.toString();
    return param;
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
}

class CustomDialog extends StatelessWidget {
  UpcomingMatch upcomingMatchData;
  var playingList;

  CustomDialog(final this.playingList, this.upcomingMatchData);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: dialogContent(context, playingList, upcomingMatchData),
    );
  }

  dialogContent(BuildContext context, final playingList,
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
              itemCount: playingList.length,
              itemBuilder: (BuildContext context, int index) {
                return listItem(context, playingList, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(BuildContext context, final playingList, int index) {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: new ClipRRect(
              borderRadius: new BorderRadius.circular(50.0),
              child: checkBlank(playingList[index]['profile_pic']) != ""
                  ? Image.network(
                      playingList[index]['profile_pic'],
                      height: 55.0,
                      width: 55.0,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      height: 55.0,
                      width: 55.0,
                      color: primaryColor,
                      child: Image.asset(
                        Images.LOGO_TRANSPARENT,
                        fit: BoxFit.cover,
                      ),
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
                      playingList[index]['name'],
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
                  getStatus(playingList, index),
                  style: Theme.of(context).textTheme.body1.copyWith(
                      fontSize: 14.0,
                      color: getStatusColor(playingList, index)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  String getStatus(final playingList, final int index) {
    switch (playingList[index]['play_status']) {
      case 0:
        return "Not Confirmed";
      case 1:
        return "Playing";
      case 2:
        return "Not available";
      default:
        return "Not Confirmed";
    }
  }

  getStatusColor(final playingList, final int index) {
    switch (playingList[index]['play_status']) {
      case 0:
        return Colors.grey;
      case 1:
        return greenColor;
      case 2:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
