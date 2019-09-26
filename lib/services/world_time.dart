import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  String location; // location name for UI
  var time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDayTime; // true -> day time, false -> night time

  WorldTime({this.location, this.flag, this.url, this.isDayTime = true});

  Future<void> getTime() async {
    try {
      // make the request
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      // get properties from json
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      print(now);

      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;

      // set the time property
      time = DateFormat.jm().format(now);
    } catch (error) {
      print('caught error: $error');
      time = 'Could not get time data';
    }
  }
}
