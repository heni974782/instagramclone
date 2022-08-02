import 'package:flutter/material.dart';

//header() {
//  return Text("header");
AppBar header(context, {bool isAppTitle = false, required String titleText}) {
  return AppBar(
    title: Text(
      isAppTitle ? 'FlutterShare' : titleText,
      style: TextStyle(
        color: Colors.white,
        fontFamily: isAppTitle ? "Signatra" : '',
        fontSize: isAppTitle ? 50 : 22,
      ),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).accentColor,
  );
}