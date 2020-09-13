import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:restapi/main.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final String url = "http://dummy.restapiexample.com/api/v1/employees";
  List data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getJsondata();
  }

  Future<String>getJsondata() async{
    var response = await http.get('http://dummy.restapiexample.com/api/v1/employees'
      //Encode the url
      // Uri.encodeFull(url),
      //only accept json response
      //headers: {"Accept":"application.json"}
    );
    // print(response.body);

    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson['data'];
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Retrieve HTTP data"),
      ),
      body: new ListView.builder(
          itemCount: data ==null ? 0 : data.length ,
          itemBuilder: (BuildContext context, int index){
            return new Container(
              child: new Center(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    new Card(
                      child: new Container(
                          child: new Text(data[index]['employee_name'],style: TextStyle(fontSize: 20),),
                          padding: const EdgeInsets.all(20.0)
                      ),
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
