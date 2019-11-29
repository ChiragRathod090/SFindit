import 'package:http/http.dart' as http;

//Base api service
const String BASE_URL =
    "https://www.citysidesports.com/_MOBILEAPP/sfindit/api.php?action=";

//Api lists
const String LOGIN = "login";
const String GET_TEAMS_LIST = "getTeamList";
const String GET_SEASON_LIST = "getSeasonList";
const String GET_LADDERS_FIXTURES = "getLaddersFixtures";

// 1. Login API
Future<http.Response> login(param) async {
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

// 2. Get Season List API
Future<http.Response> getSeasonList() async {
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

// 3. Get Season List API
Future<http.Response> getTeamsList(param) async {
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

// 4. Get Ladders And Fixtures API
Future<http.Response> getLaddersFixtures(param) async {
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
