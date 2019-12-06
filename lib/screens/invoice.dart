import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sfindit/Model/getSeasonInvoice.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/common/constants.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/keys.dart';
import 'package:sfindit/common/string.dart';
import 'package:sfindit/rest/api_services.dart';
import 'package:sfindit/utils/appbar.dart';

class InvoiceScreen extends StatefulWidget {
  final String title;
  final String seasonId;

  const InvoiceScreen({Key key, this.title, this.seasonId}) : super(key: key);

  @override
  _InvoiceScreenState createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  GetSeasonInvoice getSeasonInvoiceResponse;
  List<CardList> cardList;
  List<TotalDatum> totalData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSeasonInvoiceApi(widget.seasonId);
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
                                      '\$' + totalData[0].total,
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
                                Container(
                                  margin: EdgeInsets.all(30.0),
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0))),
                                    child: Text(
                                      txtPayInvoice,
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
                                    onPressed: () {},
                                  ),
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
    await getSeasonInvoice(getParametersForGetSeasonInvoice(seasonId))
        .then((response) {
      var data = json.decode(response.body);
      printResponse(
          getParametersForGetSeasonInvoice(seasonId), data.toString());
      if (data['success'] == 1) {
        getSeasonInvoiceResponse = GetSeasonInvoice.fromMap(data);
        cardList = getSeasonInvoiceResponse.result.cardList;
        totalData = getSeasonInvoiceResponse.result.totalData;
      }
      setState(() {});
    });
  }

  getParametersForGetSeasonInvoice(final String seasonId) {
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
}

/*    Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Sfindit Flyers',
                            style: Theme.of(context)
                                .textTheme
                                .body2
                                .copyWith(fontSize: 18.0, color: blackColor),
                          ),
                          Text(
                            'Full Court Metball:',
                            style: Theme.of(context).textTheme.body1.copyWith(
                                fontSize: 13.0, color: Colors.grey[600]),
                          ),
                          Text(
                            'Wednesday Ladies',
                            style: Theme.of(context).textTheme.body1.copyWith(
                                fontSize: 13.0, color: Colors.grey[600]),
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
                                    .copyWith(
                                        fontSize: 16.0,
                                        color: Colors.grey[600]),
                              ),
                              Text(
                                '15',
                                style: Theme.of(context)
                                    .textTheme
                                    .body1
                                    .copyWith(
                                        fontSize: 16.0,
                                        color: Colors.grey[600]),
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
                                    .copyWith(
                                        fontSize: 16.0,
                                        color: Colors.grey[600]),
                              ),
                              Text(
                                "\$133.0",
                                style: Theme.of(context)
                                    .textTheme
                                    .body1
                                    .copyWith(
                                        fontSize: 16.0,
                                        color: Colors.grey[600]),
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
                                    .copyWith(
                                        fontSize: 16.0,
                                        color: Colors.grey[600]),
                              ),
                              Text(
                                "\$133.0",
                                style: Theme.of(context)
                                    .textTheme
                                    .body1
                                    .copyWith(
                                        fontSize: 16.0,
                                        color: Colors.grey[600]),
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
                                    .copyWith(
                                        fontSize: 16.0,
                                        color: Colors.grey[600]),
                              ),
                              Text(
                                '\$0.0',
                                style: Theme.of(context)
                                    .textTheme
                                    .body1
                                    .copyWith(
                                        fontSize: 16.0,
                                        color: Colors.grey[600]),
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
                                    .copyWith(
                                        fontSize: 16.0,
                                        color: Colors.grey[600]),
                              ),
                              Text(
                                '12/12/2019',
                                style: Theme.of(context)
                                    .textTheme
                                    .body1
                                    .copyWith(
                                        fontSize: 16.0,
                                        color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),*/
/*Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Sfindit Cruisers',
                            style: Theme.of(context)
                                .textTheme
                                .body2
                                .copyWith(fontSize: 18.0, color: blackColor),
                          ),
                          Text(
                            'Full Court Metball:',
                            style: Theme.of(context).textTheme.body1.copyWith(
                                fontSize: 13.0, color: Colors.grey[600]),
                          ),
                          Text(
                            'Thursday Ladies',
                            style: Theme.of(context).textTheme.body1.copyWith(
                                fontSize: 13.0, color: Colors.grey[600]),
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
                                    .copyWith(
                                        fontSize: 16.0,
                                        color: Colors.grey[600]),
                              ),
                              Text(
                                '14',
                                style: Theme.of(context)
                                    .textTheme
                                    .body1
                                    .copyWith(
                                        fontSize: 16.0,
                                        color: Colors.grey[600]),
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
                                    .copyWith(
                                        fontSize: 16.0,
                                        color: Colors.grey[600]),
                              ),
                              Text(
                                "\$125.0",
                                style: Theme.of(context)
                                    .textTheme
                                    .body1
                                    .copyWith(
                                        fontSize: 16.0,
                                        color: Colors.grey[600]),
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
                                    .copyWith(
                                        fontSize: 16.0,
                                        color: Colors.grey[600]),
                              ),
                              Text(
                                "\$0.0",
                                style: Theme.of(context)
                                    .textTheme
                                    .body1
                                    .copyWith(
                                        fontSize: 16.0,
                                        color: Colors.grey[600]),
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
                                    .copyWith(
                                        fontSize: 16.0,
                                        color: Colors.grey[600]),
                              ),
                              Text(
                                '\$125.0',
                                style: Theme.of(context)
                                    .textTheme
                                    .body1
                                    .copyWith(
                                        fontSize: 16.0,
                                        color: Colors.grey[600]),
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
                                    .copyWith(
                                        fontSize: 16.0,
                                        color: Colors.grey[600]),
                              ),
                              Text(
                                '19/12/2019',
                                style: Theme.of(context)
                                    .textTheme
                                    .body1
                                    .copyWith(
                                        fontSize: 16.0,
                                        color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),*/
