import 'package:flutter/material.dart';

abstract class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

_push(BuildContext context, MaterialPageRoute materialPageRoute) {
  Navigator.push(context, materialPageRoute);
}
