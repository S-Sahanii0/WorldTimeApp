import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class ApiService{
  String location; // location name for the UI
  String time; // time in that location
  String flag; // url to an asset flag icon
  String url;
  bool isDaytime;
  ApiService({this.url, this.location, this.flag}); // location url for api endpoint
 // true if daytime else false

  Future<void> getTime() async {
    try {
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      print(response.statusCode);
      print('haha');
      print(response.body);
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'could not get time';

    }
  }

}