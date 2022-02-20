import 'package:flutter/material.dart';
import 'package:dummy_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(endPoint: "Europe/Amsterdam", assetName: "uk.png"),
    WorldTime(endPoint: "America/Santiago", assetName: "usa.png"),
    WorldTime(endPoint: "Africa/Casablanca", assetName: "egypt.png"),
  ];

  void updateTime(int index) async {
    WorldTime updatedTime = locations[index];
    await updatedTime.getTime();

    Navigator.pop(context, {
      "time": updatedTime.worldTime,
      "isDayTime": updatedTime.isDayTime,
      "location": updatedTime.location
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        title: const Text("Choose location"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          locations[index].setLocation();
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/${locations[index].assetName}"),
                ),
                title: Text(locations[index].location),
                onTap: () {
                  updateTime(index);
                },
              ),
            ),
          );
        },
        itemCount: locations.length,
      ),
    );
  }
}
