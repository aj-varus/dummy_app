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
    map = ModalRoute.of(context)!.settings.arguments! as Map;
    DateTime time = map["time"];
    bool isDayTime = map["isDayTime"] as bool;
    print(isDayTime);
    String assetImage = isDayTime ? "day.jpg" : "night.jpg";
    String timeAsStr = intl.DateFormat.jm().format(time);

    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/$assetImage"),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/choose_location");
                },
                icon: const Icon(Icons.edit_location)),
            Center(
              child: Text(
                timeAsStr,
                style: const TextStyle(
                    fontSize: 28.0, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      )),
    );
  }
}
