import 'dart:async';
import 'dart:convert';

import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:sfindit/Model/getNotifications.dart';

//Base api service
const String BASE_URL =
    "https://www.citysidesports.com/_MOBILEAPP/sfindit/api.php?action=";

//Api lists
const String LOGIN = "login";
const String GET_TEAMS_LIST = "getTeamList";
const String GET_SEASON_LIST = "getSeasonList";
const String UPDATE_PROFILE = "updateProfile";
const String GET_LADDERS_FIXTURES = "getLaddersFixtures";
const String GET_TEAM_LIST_FOR_CHAT = "getTeamListForChat";
const String OPEN_TEAM_CHAT = "openTeamChat";
const String SEND_MESSAGE = "sendMessage";
const String GET_NOTIFICATION = "getNotificationList";
const String GET_PLAYER_PLAYING_STATUS = "getPlayersPlayingStatus";
const String GET_LATEST_MESSAGES = "getLatestMessages";
const String ADD_PLAY_STATUS = "addPlayStatus";
const String GET_SEASON_INVOICE = "getSeasonInvoice";
const String PAY_INVOICE = "payInvoice";
const String GET_SUPPORT_MESSAGES = "getSupportMessages";
const String SEND_SUPPORT_MESSAGES = "sendSupportMessage";
const String GET_SUPPORT_LATEST_MESSAGES = "getSupportLatestMessages";
const String GET_VERSIONS = "getVersions";
const String GET_MESSAGE_UNREAD_FLAG = "getMessageUnreadFlag";

// 1. Login API
Future<http.Response> login(param) async {
  print("Login Api(){...}");
  var client = new http.Client();
  try {
    http.Response data = await client.post(
      BASE_URL + LOGIN + param,
    );
    return data;
  } finally {
    client.close();
  }
}

// 2. Get Teams List API
Future<http.Response> getTeamsList(param) async {
  print("getTeamsList Api(){...}");
  var client = new http.Client();
  try {
    http.Response data = await client.post(
      BASE_URL + GET_TEAMS_LIST + '&user_id=$param',
    );
    return data;
  } finally {
    client.close();
  }
}

// 3. Get Season List API
Future<http.Response> getSeasonList() async {
  print("getSeasonList Api(){...}");
  var client = new http.Client();
  try {
    http.Response data = await client.post(
      BASE_URL + GET_SEASON_LIST,
    );
    return data;
  } finally {
    client.close();
  }
}

// 4. Update Profile API (Without Profile)
Future<http.Response> updateProfile(param) async {
  print("updateProfile Api(){...}");
  var client = new http.Client();
  try {
    http.Response data = await client.post(
      BASE_URL + UPDATE_PROFILE + param,
    );
    return data;
  } finally {
    client.close();
  }
}

// 4. Update Profile API (With Profile)
updateProfileWithProfilePic(file, param, callBack) async {
  var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
  var length = await file.length();
  var uri = Uri.parse(BASE_URL + UPDATE_PROFILE);
  var request = new http.MultipartRequest("POST", uri);
  var multipartFile = new http.MultipartFile('profile_pic', stream, length,
      filename: basename(file.path));
  request.files.add(multipartFile);
  request.fields.addAll(param);
  var response = await request.send();
  response.stream.transform(utf8.decoder).listen((value) {
    callBack(value);
  });
}

// 5. Get Ladders And Fixtures API
Future<http.Response> getLaddersFixtures(param) async {
  print("getLaddersFixtures Api(){...}");
  var client = new http.Client();
  try {
    http.Response data = await client.post(
      BASE_URL + GET_LADDERS_FIXTURES + '&team_id=$param',
    );
    return data;
  } finally {
    client.close();
  }
}

// 6. Get TeamList For Chat API
Future<http.Response> getTeamListForChat(param) async {
  print("getTeamListForChat Api(){...}");
  var client = new http.Client();
  try {
    http.Response data = await client.post(
      BASE_URL + GET_TEAM_LIST_FOR_CHAT + '&user_id=$param',
    );
    return data;
  } finally {
    client.close();
  }
}

// 7. Open Team Chat
Future<http.Response> openTeamChat(param) async {
  print("openTeamChat Api(){...}");
  var client = new http.Client();
  try {
    http.Response data = await client.post(
      BASE_URL + OPEN_TEAM_CHAT + param,
    );
    return data;
  } finally {
    client.close();
  }
}

// 8. Send Message
Future<http.Response> sendMessage(param) async {
  print("sendMessage Api(){...}");
  var client = new http.Client();
  try {
    http.Response data = await client.post(
      BASE_URL + SEND_MESSAGE + '&user_id=$param',
    );
    return data;
  } finally {
    client.close();
  }
}

// 9. Get Notification
Future<GetNotifications> getNotification(param) async {
  print("getNotification Api(){...}");
  var client = new http.Client();
  try {
    var data = await client.post(
      BASE_URL + GET_NOTIFICATION + param,
    );
    return GetNotifications.fromMap(json.decode(data.body));
  } finally {
    client.close();
  }
}

// 10. Get Player PlayingStatus
Future<http.Response> getPlayerPlayingStatus(param) async {
  print("getPlayerPlayingStatus Api(){...}");
  var client = new http.Client();
  try {
    http.Response data = await client.post(
      BASE_URL + GET_PLAYER_PLAYING_STATUS + '&user_id=$param',
    );
    return data;
  } finally {
    client.close();
  }
}

// 11. Get Latest Messages
Future<http.Response> getLatestMessages(param) async {
  print("getLatestMessages Api(){...}");
  var client = new http.Client();
  try {
    http.Response data = await client.post(
      BASE_URL + GET_LATEST_MESSAGES + param,
    );
    return data;
  } finally {
    client.close();
  }
}

// 12. Add Play Status
Future<http.Response> addPlayStatus(param) async {
  print("addPlayStatus Api(){...}");
  var client = new http.Client();
  try {
    http.Response data = await client.post(
      BASE_URL + ADD_PLAY_STATUS + param,
    );
    return data;
  } finally {
    client.close();
  }
}

// 13. Get Season Invoice
Future<http.Response> getSeasonInvoice(param) async {
  print("getSeasonInvoice Api(){...}");
  var client = new http.Client();
  try {
    http.Response data = await client.post(
      BASE_URL + GET_SEASON_INVOICE + param,
    );
    return data;
  } finally {
    client.close();
  }
}

// 14. Pay Invoice
Future<http.Response> payInvoice(param) async {
  print("payInvoice Api(){...}");
  var client = new http.Client();
  try {
    http.Response data = await client.post(
      BASE_URL + PAY_INVOICE + param,
    );
    return data;
  } finally {
    client.close();
  }
}

// 15. Get Support Messages
Future<http.Response> getSupportMessages(param) async {
  print("getSupportMessages Api(){...}");
  var client = new http.Client();
  try {
    http.Response data = await client.post(
      BASE_URL + GET_SUPPORT_MESSAGES + '&user_id=$param',
    );
    return data;
  } finally {
    client.close();
  }
}

// 16. Send Support Message
Future<http.Response> sendSupportMessage(param) async {
  print("sendSupportMessage Api(){...}");
  var client = new http.Client();
  try {
    http.Response data = await client.post(
      BASE_URL + SEND_SUPPORT_MESSAGES + param,
    );
    return data;
  } finally {
    client.close();
  }
}

// 17. Get Support Latest Messages
Future<http.Response> getSupportLatestMessages(param) async {
  print("getSupportLatestMessages Api(){...}");
  var client = new http.Client();
  try {
    http.Response data = await client.post(
      BASE_URL + GET_SUPPORT_LATEST_MESSAGES + param,
    );
    return data;
  } finally {
    client.close();
  }
}

// 18. Get App Versions
Future<http.Response> getVersions() async {
  print("getVersions Api(){...}");
  var client = new http.Client();
  try {
    http.Response data = await client.post(
      BASE_URL + GET_VERSIONS,
    );
    return data;
  } finally {
    client.close();
  }
}

// 19. Get Message Unread Flag
Future<http.Response> getMessageUnreadFlag(param) async {
  print("getMessageUnreadFlag Api(){...}");
  var client = new http.Client();
  try {
    http.Response data = await client.post(
      BASE_URL + GET_MESSAGE_UNREAD_FLAG + '&user_id=$param',
    );
    return data;
  } finally {
    client.close();
  }
}

//saveProfileWithFileApi(apiName, file, pram, callBack) async {
//  var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
//  var length = await file.length();
//  var uri = Uri.parse(BASE_URL + apiName);
//  var request = new http.MultipartRequest("POST", uri);
//  var multipartFile = new http.MultipartFile('profilepic', stream, length,
//      filename: basename(file.path));
//  request.files.add(multipartFile);
//  request.fields.addAll(pram);
//  request.headers.addAll({
//    'content-type': 'application/json',
//    'Authorization': '${getToken(Keys.USER_TOKEN)}'
//  });
//  var response = await request.send();
//  response.stream.transform(utf8.decoder).listen((value) {
//    callBack(value);
//  });
//}
//
//Future<http.Response> saveProfileApi(apiName, pram) async {
//  var client = new http.Client();
//  try {
//    http.Response data = await client.post(BASE_URL + apiName,
//        body: json.encode(pram),
//        headers: ({
//          'content-type': 'application/json',
//          'Authorization': '${getToken(Keys.USER_TOKEN)}'
//        }));
//    return data;
//  } finally {
//    client.close();
//  }
//}
//
//Future<http.Response> getServiceRequestApi(apiName, pram) async {
//  var client = new http.Client();
//  try {
//    http.Response data = await client.post(BASE_URL + apiName,
//        body: json.encode(pram),
//        headers: ({
//          'content-type': 'application/json',
//          'Authorization': '${getToken(Keys.USER_TOKEN)}'
//        }));
//    return data;
//  } finally {
//    client.close();
//  }
//}
//
//Future<http.Response> changePasswordApi(apiName, pram) async {
//  var client = new http.Client();
//  try {
//    http.Response data = await client.post(BASE_URL + apiName,
//        body: json.encode(pram),
//        headers: ({
//          'content-type': 'application/json',
//          'Authorization': '${getToken(Keys.USER_TOKEN)}'
//        }));
//    return data;
//  } finally {
//    client.close();
//  }}
