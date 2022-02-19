import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldTime {
  DateTime indianTime = DateTime(2022);

  Future<DateTime> getTime() async {
    String hours, minutes;

    try {
      Uri url = Uri.parse(
          "http://worldtimeapi.org/api/timezone/Asia/Kolkata"); //Uri.parse("https://jsonplaceholder.typicode.com/todos/1");
      http.Response response = await http.get(url);
      Map map = jsonDecode(response.body);

      DateTime utcDatetime = DateTime.parse(map["utc_datetime"]);
      var offsetList = map["utc_offset"].split(":");
      hours = offsetList[0].substring(1);
      minutes = offsetList[1];
      indianTime = utcDatetime
          .add(Duration(hours: int.parse(hours), minutes: int.parse(minutes)));
    } catch (e) {
      print("Error found");
    }
    finally {
      // ignore: control_flow_in_finally
      return indianTime;
    }

    
  }
}
