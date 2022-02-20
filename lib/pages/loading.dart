import 'package:flutter/material.dart';
import 'package:dummy_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  
  String time = "loading";

  void getTime() async {
    WorldTime worldTime =
        WorldTime(endPoint: "Asia/Kolkata", assetName: "India.jpg");
    await worldTime.getTime();
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, "/location", arguments: {
      "time": worldTime.worldTime,
      "isDayTime": worldTime.isDayTime,
      "location": worldTime.location
    });
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const SpinKitFadingCube(
        color: Colors.white,
        size: 80.0,
      ),
    );
  }
}
