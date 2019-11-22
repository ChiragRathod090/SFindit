import 'package:flutter/material.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/string.dart';
import 'package:sfindit/utils/appbar.dart';

class InvoiceScreen extends StatefulWidget {
  final String title;

  const InvoiceScreen({Key key, this.title}) : super(key: key);

  @override
  _InvoiceScreenState createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
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
//                              style: TextStyle(
//                                  color: blackColor,
//                                  fontSize: 18,
//                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Full Court Metball:',
                              style: Theme.of(context).textTheme.body1.copyWith(
                                  fontSize: 13.0, color: Colors.grey[600]),
                              //style: TextStyle(color: Colors.grey[600], fontSize: 13),
                            ),
                            Text(
                              'Wednesday Ladies',
                              style: Theme.of(context).textTheme.body1.copyWith(
                                  fontSize: 13.0, color: Colors.grey[600]),
                              //style: TextStyle(color: Colors.grey[600], fontSize: 13),
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
                                  //style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                ),
                                Text(
                                  '15',
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(
                                          fontSize: 16.0,
                                          color: Colors.grey[600]),
                                  //style: TextStyle(fontSize: 16, color: Colors.grey[600]),
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
                                  //style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                ),
                                Text(
                                  "\$133.0",
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(
                                          fontSize: 16.0,
                                          color: Colors.grey[600]),
                                  //style: TextStyle(fontSize: 16, color: Colors.grey[600]),
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
                                  //style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                ),
                                Text(
                                  "\$133.0",
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(
                                          fontSize: 16.0,
                                          color: Colors.grey[600]),
                                  //style: TextStyle(fontSize: 16, color: Colors.grey[600]),
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
                                  //style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                ),
                                Text(
                                  '\$0.0',
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(
                                          fontSize: 16.0,
                                          color: Colors.grey[600]),
                                  //style: TextStyle(fontSize: 16, color: Colors.grey[600]),
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
                                  //style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                ),
                                Text(
                                  '12/12/2019',
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(
                                          fontSize: 16.0,
                                          color: Colors.grey[600]),
                                  //style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
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
//                              style: TextStyle(
//                                  color: blackColor,
//                                  fontSize: 18,
//                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Full Court Metball:',
                              style: Theme.of(context).textTheme.body1.copyWith(
                                  fontSize: 13.0, color: Colors.grey[600]),
                              //style: TextStyle(color: Colors.grey[600], fontSize: 13),
                            ),
                            Text(
                              'Thursday Ladies',
                              style: Theme.of(context).textTheme.body1.copyWith(
                                  fontSize: 13.0, color: Colors.grey[600]),
                              //style: TextStyle(color: Colors.grey[600], fontSize: 13),
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
                                  //style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                ),
                                Text(
                                  '14',
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(
                                          fontSize: 16.0,
                                          color: Colors.grey[600]),
                                  //style: TextStyle(fontSize: 16, color: Colors.grey[600]),
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
                                  //style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                ),
                                Text(
                                  "\$125.0",
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(
                                          fontSize: 16.0,
                                          color: Colors.grey[600]),
                                  //style: TextStyle(fontSize: 16, color: Colors.grey[600]),
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
                                  //style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                ),
                                Text(
                                  "\$0.0",
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(
                                          fontSize: 16.0,
                                          color: Colors.grey[600]),
                                  //style: TextStyle(fontSize: 16, color: Colors.grey[600]),
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
                                  //style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                ),
                                Text(
                                  '\$125.0',
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(
                                          fontSize: 16.0,
                                          color: Colors.grey[600]),
                                  //style: TextStyle(fontSize: 16, color: Colors.grey[600]),
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
                                  //style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                ),
                                Text(
                                  '19/12/2019',
                                  style: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .copyWith(
                                          fontSize: 16.0,
                                          color: Colors.grey[600]),
                                  //style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Text(
                            "Total payable amount",
                            style: Theme.of(context).textTheme.body1.copyWith(
                                fontSize: 16.0, backgroundColor: whiteColor),
                            //style: TextStyle(backgroundColor: whiteColor, fontSize: 18),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Total',
                              style: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .copyWith(fontSize: 17.0, color: blackColor),
                              //style: TextStyle(fontSize: 17, color: blackColor),
                            ),
                            Text(
                              '\$258.0',
                              style: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .copyWith(fontSize: 17.0, color: blackColor),
                              //style: TextStyle(fontSize: 17, color: blackColor),
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
                              'GST',
                              style: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .copyWith(fontSize: 17.0, color: blackColor),
                              //style: TextStyle(fontSize: 17, color: blackColor),
                            ),
                            Text(
                              '\$23.45',
                              style: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .copyWith(fontSize: 17.0, color: blackColor),
                              //style: TextStyle(fontSize: 17, color: blackColor),
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
                                  .copyWith(fontSize: 17.0, color: blackColor),
                              //style: TextStyle(fontSize: 17, color: blackColor),
                            ),
                            Text(
                              '\$133.0',
                              style: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .copyWith(fontSize: 17.0, color: blackColor),
                              //style: TextStyle(fontSize: 17, color: blackColor),
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
                              'Owing',
                              style: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .copyWith(fontSize: 17.0, color: blackColor),
                              //style: TextStyle(fontSize: 17, color: blackColor),
                            ),
                            Text(
                              '\$125.0',
                              style: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .copyWith(fontSize: 17.0, color: blackColor),
                              //style: TextStyle(fontSize: 17, color: blackColor),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            child: Text(
                              txtPayInvoice,
                              style: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .copyWith(fontSize: 18.0, color: whiteColor),
                              //style: TextStyle(fontSize: 18)
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
