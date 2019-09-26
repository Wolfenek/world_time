import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map incomingData = {};

  @override
  Widget build(BuildContext context) {
    incomingData = incomingData.isNotEmpty
        ? incomingData
        : ModalRoute.of(context).settings.arguments;

    // set background image
    String bgImage = incomingData['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor =
        incomingData['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      incomingData = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.adb,
                    size: 30,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey[300],
                    ),
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
                      style: TextStyle(
                          fontSize: 28, letterSpacing: 2, color: Colors.white),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  incomingData['time'],
                  style: TextStyle(fontSize: 66, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
