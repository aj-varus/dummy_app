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
    String timeAsStr = intl.DateFormat.jm().format(time);
    print(time);
    print(timeAsStr);

    return Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/payment");
                  },
                  icon: const Icon(Icons.edit_location)),
              Center(
                child: Text(
                  timeAsStr,
                  style: const TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          )),
    );
  }
}
