import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    // simulate network request for a username
    // await Future.delayed(Duration(seconds: 3), () => print('pepega'));
    // await Future.delayed(Duration(seconds: 2), () {
    //   print('Luigi');
    // });
    // print('statement');
    String username = await Future.delayed(Duration(seconds: 2), () {
      return 'Yoshi';
    });
    int age = await Future.delayed(Duration(seconds: 3), () {
      return 25;
    });

    print('$username - $age years old');
  }

  @override
  void initState() {
    super.initState();
    getData();
    // Print below runs first. There's no await keyword in front of it
    print('hey there');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('loading screen'));
  }
}
