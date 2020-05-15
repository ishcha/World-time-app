import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for UI
  String time; // time in that location
  String date;
  String flag; //url to asset file icon
  String url; //location url for api endpoints
  bool isDayTime; //true or false if day/night

  WorldTime({ this.location, this.flag, this.url });



  Future<void> getTime() async {
    try {
      //make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data

      String datetime = data['datetime'];
      String offset_h = data['utc_offset'].substring(0, 3);
      String offset_m = data['utc_offset'].substring(4, 6);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset_h), minutes: int.parse(offset_m)));

      //set time property
      isDayTime = now.hour >6 && now.hour < 20 ? true: false;
      time = DateFormat.jms().format(now);
      date = DateFormat.yMMMd().format(now);
    }
    catch(e) {
        print('caught error $e');
        time = 'could not get time data';
        date = 'could not get time data';
    }
  }
}

 //WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');