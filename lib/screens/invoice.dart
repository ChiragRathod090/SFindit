import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sfindit/Model/getSeasonInvoice.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/common/config.dart';
import 'package:sfindit/common/constants.dart';
import 'package:sfindit/common/custom_dialog.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/keys.dart';
import 'package:sfindit/common/loding.dart';
import 'package:sfindit/common/string.dart';
import 'package:sfindit/common/transaction_service.dart';
import 'package:sfindit/rest/api_services.dart';
import 'package:sfindit/utils/appbar.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';

class InvoiceScreen extends StatefulWidget {
  final String title;
  final String seasonId;
  final int cookieAmount = 00;

  const InvoiceScreen({Key key, this.title, this.seasonId}) : super(key: key);

  final String cardNumber = "4111 1111 1111";
  final String expiryDate = "12/21";
  final String cvv = "111";
  final String zipCode = "94107";

  @override
  _InvoiceScreenState createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  GetSeasonInvoice getSeasonInvoiceResponse;
  List<CardList> cardList;
  List<TotalDatum> totalData;
  double totlePrice;

//  bool get _chargeServerHostReplaced => chargeServerHost != "REPLACE_ME";
//
//  bool get _squareLocationSet => squareLocationId != "REPLACE_ME";
//
//  bool get _applePayMerchantIdSet => applePayMerchantId != "REPLACE_ME";

//  bool isLoading = true;
//  bool applePayEnabled = false;
//  bool googlePayEnabled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initSquarePayment();
    getSeasonInvoiceApi(widget.seasonId);
  }

  Future<void> _initSquarePayment() async {
    await InAppPayments.setSquareApplicationId(squareApplicationId);

//    var canUseApplePay = false;
//    var canUseGooglePay = false;
//
//    if (Platform.isAndroid) {
//      await InAppPayments.initializeGooglePay(
//          squareLocationId, google_pay_constants.environmentTest);
//      canUseGooglePay = await InAppPayments.canUseGooglePay;
//    } else if (Platform.isIOS) {
//      await _setIOSCardEntryTheme();
//      await InAppPayments.initializeApplePay(applePayMerchantId);
//      canUseApplePay = await InAppPayments.canUseApplePay;
//    }
//
//    setState(() {
//      isLoading = false;
//      applePayEnabled = canUseApplePay;
//      googlePayEnabled = canUseGooglePay;
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(widget.title, false),
      body: Column(
        children: <Widget>[
          Image.asset(
            Images.APPBAR_HEADER,
          ),
          Expanded(
            child: getSeasonInvoiceResponse == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : cardList.length > 0
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ListView.builder(
                                    itemCount: cardList.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return listItem(cardList[index]);
                                    },
                                  ))),
                          SizedBox(
                            height: 50.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  height: 1.0,
                                  width: MediaQuery.of(context).size.width / 6,
                                  color: Colors.grey,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  child: Text(
                                    "Total payable amount",
                                    style: Theme.of(context)
                                        .textTheme
                                        .body1
                                        .copyWith(
                                            fontSize: 16.0,
                                            backgroundColor: whiteColor),
                                  ),
                                ),
                                Container(
                                  height: 1.0,
                                  width: MediaQuery.of(context).size.width / 6,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Total',
                                      style: Theme.of(context)
                                          .textTheme
                                          .body1
                                          .copyWith(
                                              fontSize: 17.0,
                                              color: blackColor),
                                    ),
                                    Text(
                                      '\$' + totlePrice.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .body1
                                          .copyWith(
                                              fontSize: 17.0,
                                              color: blackColor),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'GST',
                                      style: Theme.of(context)
                                          .textTheme
                                          .body1
                                          .copyWith(
                                              fontSize: 17.0,
                                              color: blackColor),
                                    ),
                                    Text(
                                      '\$0.00',
                                      style: Theme.of(context)
                                          .textTheme
                                          .body1
                                          .copyWith(
                                              fontSize: 17.0,
                                              color: blackColor),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Paid',
                                      style: Theme.of(context)
                                          .textTheme
                                          .body1
                                          .copyWith(
                                              fontSize: 17.0,
                                              color: blackColor),
                                    ),
                                    Text(
                                      '\$' + totalData[0].paid,
                                      style: Theme.of(context)
                                          .textTheme
                                          .body1
                                          .copyWith(
                                              fontSize: 17.0,
                                              color: blackColor),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Owing',
                                      style: Theme.of(context)
                                          .textTheme
                                          .body1
                                          .copyWith(
                                              fontSize: 17.0,
                                              color: blackColor),
                                    ),
                                    Text(
                                      '\$' + totalData[0].owning,
                                      style: Theme.of(context)
                                          .textTheme
                                          .body1
                                          .copyWith(
                                              fontSize: 17.0,
                                              color: blackColor),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                totlePrice > 0
                                    ? Container(
                                        margin: EdgeInsets.all(30.0),
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0))),
                                          child: Text(
                                            txtPaySecurely,
                                            style: Theme.of(context)
                                                .textTheme
                                                .body1
                                                .copyWith(
                                                    fontSize: 18.0,
                                                    color: whiteColor),
                                          ),
                                          color: orangeColor,
                                          padding: EdgeInsets.only(
                                              left: 50.0,
                                              right: 50.0,
                                              top: 10.0,
                                              bottom: 10.0),
                                          textColor: whiteColor,
                                          onPressed: () {
                                            double totalFurther =
                                                (totlePrice / 1.9 + 0.30);
                                            var total =
                                                totalFurther.toStringAsFixed(2);
                                            _showDialog(context, total);
                                          },
                                        ),
                                      )
                                    : Container(
                                        margin: EdgeInsets.only(top: 10.0),
                                      ),
                              ],
                            ),
                          )
                        ],
                      )
                    : Container(
                        child: Center(
                            child: Text(
                          txtNoDataFound,
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .copyWith(fontSize: 20.0),
                        )),
                      ),
          )
        ],
      ),
    );
  }

  getSeasonInvoiceApi(final String seasonId) async {
    await getSeasonInvoice(getParametersForAllApiInThisPage(seasonId))
        .then((response) {
      var data = json.decode(response.body);
      printResponse(
          getParametersForAllApiInThisPage(seasonId), data.toString());
      if (data['success'] == 1) {
        getSeasonInvoiceResponse = GetSeasonInvoice.fromMap(data);
        cardList = getSeasonInvoiceResponse.result.cardList;
        totalData = getSeasonInvoiceResponse.result.totalData;
        totlePrice =
            double.parse(getSeasonInvoiceResponse.result.totalData[0].total);
      }
      setState(() {});
    });
  }

  payInvoiceApi(final String seasonId) {
    payInvoice(getParametersForAllApiInThisPage(seasonId)).then((response) {
      Navigator.pop(context);
      var data = json.decode(response.body);
      printResponse(
          getParametersForAllApiInThisPage(seasonId), data.toString());
      if (data['success'] == 1) {
        dialog(data['message'].toString(), context);
      } else {
        dialog(data['message'].toString(), context);
      }
      setState(() {});
    });
  }

  getParametersForAllApiInThisPage(final String seasonId) {
    String param =
        "&user_id=" + getPrefValue(Keys.USER_ID) + "&season_id=" + seasonId;
    return param;
  }

  Widget listItem(CardList list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    list.teamName,
                    style: Theme.of(context)
                        .textTheme
                        .body2
                        .copyWith(fontSize: 18.0, color: blackColor),
                  ),
                  Text(
                    list.sport + " (" + list.venueName + ")",
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(fontSize: 13.0, color: Colors.grey[600]),
                  ),
                  Text(
                    list.day + " " + list.compType,
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(fontSize: 13.0, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Divider(
            color: Colors.grey[400],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Weeks',
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontSize: 16.0, color: Colors.grey[600]),
                      ),
                      Text(
                        list.weeks,
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontSize: 16.0, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Cost',
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontSize: 16.0, color: Colors.grey[600]),
                      ),
                      Text(
                        "\$" + list.cost,
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontSize: 16.0, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Paid',
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontSize: 16.0, color: Colors.grey[600]),
                      ),
                      Text(
                        "\$" + list.paid,
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontSize: 16.0, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Due',
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontSize: 16.0, color: Colors.grey[600]),
                      ),
                      Text(
                        "\$" + list.due,
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontSize: 16.0, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Due date',
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontSize: 16.0, color: Colors.grey[600]),
                      ),
                      Text(
                        list.remaining,
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontSize: 16.0, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _onStartCardEntryFlowWithBuyerVerification() async {
    print("_onStartCardEntryFlowWithBuyerVerification(){...}");
    var money = Money((b) => b
      ..amount = totlePrice.toInt()
      ..currencyCode = 'USD' /*'AUD'*/);

    var contact = Contact((b) => b
          ..givenName = getPrefValue(Keys.NAME)
          ..email = getPrefValue(Keys.EMAIL)
          ..phone = getPrefValue(Keys.MOBILE)
        );

    await InAppPayments.startCardEntryFlowWithBuyerVerification(
        onBuyerVerificationSuccess: _onBuyerVerificationSuccess,
        onBuyerVerificationFailure: _onBuyerVerificationFailure,
        onCardEntryCancel: _onCancelCardEntryFlow,
        buyerAction: "Charge",
        money: money,
        squareLocationId: squareLocationId,
        contact: contact,
        collectPostalCode: true);
  }

  void _onBuyerVerificationSuccess(
    BuyerVerificationDetails result,
  ) async {
    print("_onBuyerVerificationSuccess(){...}" + result.nonce);
    print("_onBuyerVerificationSuccess(){...}" + result.token);
    print("result : " + result.toString());

    try {
      showDialog(context: context, builder: (context) => Loading());
      await chargeCardAfterBuyerVerification(result, totlePrice.toInt())
          .then((response) {
        print(json.decode(response.body));
        payInvoiceApi(widget.seasonId);
      });
    } on ChargeException catch (ex) {
      showAlertDialog(
          context: context,
          title: "Error processing card payment",
          description: ex.errorMessage);
    }
  }

  void _onBuyerVerificationFailure(ErrorInfo errorInfo) async {
    print("_onBuyerVerificationFailure(){...}");
    // handle the error
    showAlertDialog(
        context: context, title: "Error", description: errorInfo.message);
  }

  //   * Callback when card entry is cancelled and UI is closed

  void _onCancelCardEntryFlow() {
    print("_onCancelCardEntryFlow(){...}");
    // Handle the cancel callback
  }

  void _showDialog(BuildContext context, String total) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: new Text(
              "A 1.9% plus 30c fee applies to all Square transactions. A further ${total} will be added to your payment."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
                child: Text("Continue"),
                onPressed: () {
                  Navigator.pop(context);
                  _onStartCardEntryFlowWithBuyerVerification();
                }),
          ],
        );
      },
    );
  }

//   * An event listener to start card entry flow

/*

  void _showUrlNotSetAndPrintCurlCommand(String nonce,
      {String verificationToken}) {
    String title;
    if (verificationToken != null) {
      title = "Nonce and verification token generated but not charged";
    } else {
      title = "Nonce generated but not charged";
    }
    showAlertDialog(
        context: context,
        title: title,
        description:
            "Check your console for a CURL command to charge the nonce, or replace CHARGE_SERVER_HOST with your server host.");
    // printCurlCommand(nonce, verificationToken);
  }

  Future<void> _onStartCardEntryFlow() async {
    print("_onStartCardEntryFlow(){...}");
    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: _onCardEntryCardNonceRequestSuccess,
        onCardEntryCancel: _onCancelCardEntryFlow);
  }

//   * Callback when successfully get the card nonce details for processig
//   * card entry is still open and waiting for processing card nonce details

  void _onCardEntryCardNonceRequestSuccess(CardDetails result) async {
    print("_onCardEntryCardNonceRequestSuccess(){...} : " + result.nonce);
    print("_onCardEntryCardNonceRequestSuccess(){...} : " + result.toString());
    if (!_chargeServerHostReplaced) {
      InAppPayments.completeCardEntry(
          onCardEntryComplete: _onCardEntryComplete);
      _showUrlNotSetAndPrintCurlCommand(result.nonce);
      return;
    }
    try {
      await chargeCard(result);
      InAppPayments.completeCardEntry(
          onCardEntryComplete: _onCardEntryComplete);
    } on ChargeException catch (ex) {
      InAppPayments.showCardNonceProcessingError(ex.errorMessage);
    }
  }

//   * Callback when the card entry is closed after call 'completeCardEntry'

  void _onCardEntryComplete() {
    print("_onCardEntryComplete(){...}");
    if (_chargeServerHostReplaced) {
      showAlertDialog(
          context: context,
          title: "Your order was successful",
          description:
              "Go to your Square dashbord to see this order reflected in the sales tab.");
    }
  }
*/

}
