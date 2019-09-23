import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map incomingData = {};

  @override
  Widget build(BuildContext context) {
    incomingData = ModalRoute.of(context).settings.arguments;
    print(incomingData);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(
                  Icons.adb,
                  size: 30,
                ),
                label: Text(
                  'Edit Location',
                  style: TextStyle(fontSize: 22),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    incomingData['location'],
                    style: TextStyle(fontSize: 28, letterSpacing: 2),
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                incomingData['time'],
                style: TextStyle(fontSize: 66),
              )
            ],
          ),
        ),
      ),
    );
  }
}
