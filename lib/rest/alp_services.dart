import 'dart:convert';

import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:sfindit/common/constants.dart';
import 'package:sfindit/common/keys.dart';

//Base api service
const String BASE_URL =
    "https://www.citysidesports.com/_MOBILEAPP/sfindit/api.php/";

//Api lists
const String GET_LANGUAGE = "getLanguages";

saveProfileWithFileApi(apiName, file, pram, callBack) async {
  var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
  var length = await file.length();
  var uri = Uri.parse(BASE_URL + apiName);
  var request = new http.MultipartRequest("POST", uri);
  var multipartFile = new http.MultipartFile('profilepic', stream, length,
      filename: basename(file.path));
  request.files.add(multipartFile);
  request.fields.addAll(pram);
  request.headers.addAll({
    'content-type': 'application/json',
    'Authorization': '${getToken(Keys.USER_TOKEN)}'
  });
  var response = await request.send();
  response.stream.transform(utf8.decoder).listen((value) {
    callBack(value);
  });
}

Future<http.Response> saveProfileApi(apiName, pram) async {
  var client = new http.Client();
  try {
    http.Response data = await client.post(BASE_URL + apiName,
        body: json.encode(pram),
        headers: ({
          'content-type': 'application/json',
          'Authorization': '${getToken(Keys.USER_TOKEN)}'
        }));
    return data;
  } finally {
    client.close();
  }
}

Future<http.Response> getServiceRequestApi(apiName, pram) async {
  var client = new http.Client();
  try {
    http.Response data = await client.post(BASE_URL + apiName,
        body: json.encode(pram),
        headers: ({
          'content-type': 'application/json',
          'Authorization': '${getToken(Keys.USER_TOKEN)}'
        }));
    return data;
  } finally {
    client.close();
  }
}

Future<http.Response> changePasswordApi(apiName, pram) async {
  var client = new http.Client();
  try {
    http.Response data = await client.post(BASE_URL + apiName,
        body: json.encode(pram),
        headers: ({
          'content-type': 'application/json',
          'Authorization': '${getToken(Keys.USER_TOKEN)}'
        }));
    return data;
  } finally {
    client.close();
  }
}
