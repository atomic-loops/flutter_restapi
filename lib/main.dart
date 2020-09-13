import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:restapi/listdisplay.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
    Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Center(
          child: RaisedButton(
            child: Text("Display List"),
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => HomePage()
            )),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
