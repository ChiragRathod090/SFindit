/*
 Copyright 2018 Square Inc.
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
*/
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:square_in_app_payments/models.dart';

// Replace this with the server host you create, if you have your own server running
// e.g. https://server-host.com
String chargeServerHost = "https://connect.squareupsandbox.com/v2/payments";
//String chargeUrl = "$chargeServerHost/chargeForCookie";
String chargeUrl = "https://connect.squareupsandbox.com/v2/payments";

class ChargeException implements Exception {
  String errorMessage;

  ChargeException(this.errorMessage);
}

Future<void> chargeCard(CardDetails result) async {
  var body = jsonEncode({"nonce": result.nonce});
  http.Response response;
  try {
    response = await http.post(chargeUrl, body: body, headers: {
      "Accept": "application/json",
      "Authorization":
          "Bearer EAAAEPMz-1I1p7AI6eBT09Fwvq5rZbUknhiRSA2Af_UmZnqalk0bIE0vI-xdFmrZ",
      "content-type": "application/json"
    });
  } on SocketException catch (ex) {
    throw ChargeException(ex.message);
  }

  var responseBody = json.decode(response.body);
  if (response.statusCode == 200) {
    return;
  } else {
    throw ChargeException(responseBody["errorMessage"]);
  }
}

Future<http.Response> chargeCardAfterBuyerVerification(
    BuyerVerificationDetails result, int price) async {
  //var body = jsonEncode({"nonce": result.nonce, "token": result.token});

  http.Response response;
  try {
    response = await http
        .post(chargeUrl, body: json.encode(getParams(result, price)), headers: {
      "Accept": "application/json",
      "Authorization":
          "Bearer EAAAEPMz-1I1p7AI6eBT09Fwvq5rZbUknhiRSA2Af_UmZnqalk0bIE0vI-xdFmrZ",
      "content-type": "application/json"
    });
  } on SocketException catch (ex) {
    throw ChargeException(ex.message);
  }
  print("Api : " + response.body);
  var responseBody = json.decode(response.body);
  if (response.statusCode == 200) {
    return response;
  } else {
    throw ChargeException(responseBody["errorMessage"]);
  }
}

getParams(BuyerVerificationDetails result, int price) {
  return {
    'idempotency_key': new Random().nextInt(10000000).toString(),
    'autocomplete': true,
    'amount_money': {
      'amount': price,
      'currency': 'USD' /*'AUD'*/,
    },
    'source_id': result.nonce,
  };
}
