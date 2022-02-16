import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/payment");
              },
              icon: const Icon(Icons.edit_location))),
    );
  }
}
