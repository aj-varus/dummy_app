import 'package:flutter/material.dart';
import 'package:dummy_app/services/world_time.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String time = "loading";

  void getTime() async {
    WorldTime worldTime = WorldTime();
    DateTime dateTime = await worldTime.getTime();
    setState(() {
      time = dateTime.toString();
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
      appBar: AppBar(
        title: const Text("Payment"),
        centerTitle: true,
      ),
      body: SafeArea(child: Text(time)),
    );
  }
}
