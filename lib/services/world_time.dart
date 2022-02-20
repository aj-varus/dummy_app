import 'package:dummy_app/pages/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime {
  late DateTime worldTime;
  String endPoint;
  String location = "Location";
  String assetName;
  bool isDayTime = false;

  WorldTime({required this.endPoint, required this.assetName});

  void setLocation() {
    location = endPoint.split("/").last;
  }

  Future<void> getTime() async {
    String hours, minutes, sign;
    setLocation();
    try {
      Uri url = Uri.parse(
          "http://worldtimeapi.org/api/timezone/$endPoint"); //Uri.parse("https://jsonplaceholder.typicode.com/todos/1");
      http.Response response = await http.get(url);
      Map map = jsonDecode(response.body);

      DateTime utcDatetime = DateTime.parse(map["utc_datetime"]);
      var offsetList = map["utc_offset"].split(":");
      sign = offsetList[0].substring(0, 1);
      hours = offsetList[0].substring(1);
      minutes = offsetList[1];
      if(sign == "+") {
        worldTime = utcDatetime
          .add(Duration(hours: int.parse(hours), minutes: int.parse(minutes)));
      }
      else {
        worldTime = utcDatetime
          .subtract(Duration(hours: int.parse(hours), minutes: int.parse(minutes)));
      }
      
      isDayTime = worldTime.hour >= 6 && worldTime.hour < 18 ? true : false;
    } catch (e) {
      print("Error found");
    } finally {
      // ignore: control_flow_in_finally
      return;
    }
  }
}
