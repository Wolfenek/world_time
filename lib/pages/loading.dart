import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String currentTime = 'loading';

  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Warsaw', flag: 'poland.png', url: 'Europe/Warsaw');
    await instance.getTime();
    setState(() {
      currentTime = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text(currentTime),
      ),
    );
  }
}
