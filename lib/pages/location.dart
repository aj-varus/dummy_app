import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  Map map = {};

  @override
  Widget build(BuildContext context) {
    map = map.isNotEmpty? map : ModalRoute.of(context)!.settings.arguments! as Map;
    DateTime time = map["time"];
    bool isDayTime = map["isDayTime"] as bool;
    String location = map["location"];
    String assetImage = isDayTime ? "day.jpg" : "night.jpg";
    String timeAsStr = intl.DateFormat.jm().format(time);

    return Scaffold(
      backgroundColor: isDayTime? Colors.lightBlue : Colors.blueGrey[900],
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/$assetImage"),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () async {
                    map = await Navigator.pushNamed(context, "/choose_location") as Map;
                    setState(() {
                      time = map["time"];
                      isDayTime = map["isDayTime"];
                      location =  map["location"];
                    });
                  },
                  icon: const Icon(Icons.edit_location)),
              Center(
                child: Text(
                  location,
                  style: const TextStyle(
                      fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  timeAsStr,
                  style: const TextStyle(
                      fontSize: 55.0, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
