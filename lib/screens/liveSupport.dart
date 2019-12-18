import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sfindit/Model/getSupportMessages.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/common/constants.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/keys.dart';
import 'package:sfindit/common/string.dart';
import 'package:sfindit/rest/api_services.dart';
import 'package:sfindit/utils/appbar.dart';

class LiveSupportScreen extends StatefulWidget {
  @override
  _LiveSupportScreenState createState() => _LiveSupportScreenState();
}

class _LiveSupportScreenState extends State<LiveSupportScreen> {
  String text;

  GetSupportMessages getSupportLatestMessagesResponse;
  List<Result> chatList;
  var latestMessageId;
  Timer timer;

  TextEditingController _messageController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSupportMessagesApi();
    callSupportLatestMessageApiTimer();
  }

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
                getSupportLatestMessagesResponse == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : checkListIsNullAndBlank(chatList)
                        ? ListView.builder(
                            reverse: true,
                            padding: EdgeInsets.only(top: 12.0, bottom: 16.0),
                            itemCount: chatList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return chatList[index].replyFromSupport == "1"
                                  ? leftSideView(chatList[index])
                                  : rightSideView(chatList[index]);
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
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.grey[200]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
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
                      Result message = new Result(
                          messageId: messageId.toString(),
                          userId: getPrefValue(Keys.USER_ID),
                          message: text,
                          replyFromSupport: "0",
                          messageTimea: "now",
                          supportName: "",
                          supportPic: getPrefValue(Keys.PROFILE_PIC),
                          crtDate: "121641");
                      chatList.insert(0, message);
                      _messageController.text = "";
                      timer.cancel();
                      setState(() {});
                      sendSupportMessageApi();
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

  Widget rightSideView(Result list) {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      checkBlank(list.message),
                      style: Theme.of(context)
                          .textTheme
                          .body1
                          .copyWith(color: whiteColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, bottom: 8.0, right: 8.0),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        checkBlank(list.messageTimea),
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: whiteColor, fontSize: 10.0),
                      ),
                    ),
                  ),
                ],
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
                child: checkBlank(list.supportPic) != ""
                    ? Image.network(
                        list.supportPic,
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

  Widget leftSideView(Result list) {
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
              child: checkBlank(list.supportPic) != ""
                  ? Image.network(
                      list.supportPic,
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
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Card(
              color: Colors.grey[100],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                    child: Text(
                      list.supportName,
                      style: Theme.of(context)
                          .textTheme
                          .body1
                          .copyWith(fontSize: 12.0, color: Colors.grey[500]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 5.0, bottom: 8.0),
                    child: Text(list.message,
                        style: Theme.of(context).textTheme.body1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, bottom: 8.0, right: 8.0),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        checkBlank(list.messageTimea),
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontSize: 10.0),
                      ),
                    ),
                  ),
                ],
              ),
              margin: EdgeInsets.only(top: 6.0, bottom: 6.0),
            ),
          ),
        ],
      ),
    );
  }

  getSupportMessagesApi() async {
    await getSupportMessages(getPrefValue(Keys.USER_ID)).then((response) {
      var data = json.decode(response.body);
      printResponse(getPrefValue(Keys.USER_ID), data.toString());
      getSupportLatestMessagesResponse = GetSupportMessages.fromMap(data);
      chatList = getSupportLatestMessagesResponse.result;
      latestMessageId = chatList[0].messageId;
      setState(() {});
    });
  }

  sendSupportMessageApi() async {
    await sendSupportMessage(getParametersForSendSupportMessage())
        .then((response) {
      var data = json.decode(response.body);
      printResponse(getParametersForSendSupportMessage(), data.toString());
      if (data['success'] == 1) {
        getSupportLatestMessagesApi(true);
      }
      setState(() {});
    });
  }

  getParametersForSendSupportMessage() {
    String param =
        "&user_id=" + getPrefValue(Keys.USER_ID) + "&message=" + text;
    return param;
  }

  callSupportLatestMessageApiTimer() {
    setState(() {
      timer = Timer.periodic(Duration(seconds: 10),
          (Timer t) => getSupportLatestMessagesApi(false));
    });
  }

  getSupportLatestMessagesApi(bool isRemove) async {
    await getSupportLatestMessages(getParametersForGetSupportLatestMessages())
        .then((response) {
      var data = json.decode(response.body);
      printResponse(
          getParametersForGetSupportLatestMessages(), data.toString());
      if (isRemove) chatList.removeAt(0);
      for (var messages in data['result']) {
        latestMessageId = messages['message_id'];
        Result messageData = new Result(
            messageId: messages['message_id'],
            userId: messages['user_id'],
            message: messages['message'],
            replyFromSupport: messages['reply_from_support'],
            supportName: messages['support_name'],
            messageTimea: messages['message_timea'],
            supportPic: messages['support_pic'],
            crtDate: messages['crt_date']);
        chatList.insert(0, messageData);
      }
      if (isRemove) callSupportLatestMessageApiTimer();
    });
  }

  getParametersForGetSupportLatestMessages() {
    String param = "&user_id=" +
        getPrefValue(Keys.USER_ID) +
        "&message_id=" +
        latestMessageId;
    print(param);
    return param;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    setState(() {
      timer.cancel();
    });
  }
}
