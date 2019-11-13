import 'package:flutter/material.dart';
import 'package:sfindit/common/color.dart';
import 'package:sfindit/common/images.dart';
import 'package:sfindit/common/string.dart';
import 'package:sfindit/utils/appbar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: Image.asset(
                  Images.APPBAR_HEADER,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new ClipRRect(
                        borderRadius: new BorderRadius.circular(50.0),
                        child: Image.asset(
                          "assets/images/jocker.jpg",
                          height: 80.0,
                          width: 80.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Loream Ipsum',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Nick Name',
                            style: TextStyle(color: primaryColor, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        color: Colors.grey[500],
                        image: AssetImage(Images.MAIL),
                        height: 20.0,
                        width: 20.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "dummy@gmail.com",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        color: Colors.grey[500],
                        image: AssetImage(Images.PHONE),
                        height: 20.0,
                        width: 20.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "+61 9876543210",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      height: 1.0,
                      width: MediaQuery.of(context).size.width * 0.24,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Text(
                        "Emergency contact",
                        style: TextStyle(backgroundColor: whiteColor),
                      ),
                    ),
                    Container(
                      height: 1.0,
                      width: MediaQuery.of(context).size.width * 0.24,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        color: Colors.grey[500],
                        image: AssetImage(Images.USER_PROFILE),
                        height: 20.0,
                        width: 20.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Sam moore",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        color: Colors.grey[500],
                        image: AssetImage(Images.PHONE),
                        height: 20.0,
                        width: 20.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "+61 9876543210",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              child: Text(
                txtLogout,
                style: TextStyle(fontSize: 20, color: Colors.grey[600]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
