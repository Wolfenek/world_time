import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    // make the request
    Response response =
        await get('http://worldtimeapi.org/api/timezone/Europe/London');
    Map data = json.decode(response.body);
    //print(data);

    // get properties from json
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    //print(datetime);
    //print(offset);

    // create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
    // Print below runs first. There's no await keyword in front of it
    print('hey there');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('hello'),
      ),
    );
  }
}
