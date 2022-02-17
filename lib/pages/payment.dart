import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  void getData() async {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/todos/1");
    http.Response response = await http.get(url);
    Map map = jsonDecode(response.body);
    print(map["title"]);
  }

  @override
  void initState() {
    super.initState();
    getData();
    print("yoshi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        centerTitle: true,
      ),
      body: const SafeArea(child: Text("Payment")),
    );
  }
}
