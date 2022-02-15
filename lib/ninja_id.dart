import 'package:flutter/material.dart';

class NinjaId extends StatefulWidget {
  const NinjaId({Key? key}) : super(key: key);

  @override
  State<NinjaId> createState() => _NinjaIdState();
}

class _NinjaIdState extends State<NinjaId> {
  int buttonCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text("Ninja ID"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  radius: 40.0,
                ),
              ),
              Divider(
                height: 60.0,
                color: Colors.grey[500],
              ),
              const Text(
                "NAME",
                style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Arjun",
                style: TextStyle(
                    color: Colors.amberAccent,
                    letterSpacing: 2.0,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                "Current level",
                style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "$buttonCounter",
                style: const TextStyle(
                    color: Colors.amberAccent,
                    letterSpacing: 2.0,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "arjun.sen@yahoo.com",
                    style: TextStyle(
                        letterSpacing: 2.0,
                        color: Colors.grey[400],
                        fontSize: 18.0),
                  )
                ],
              )
            ]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              buttonCounter++;
            });
          },
          child: const Icon(
            Icons.add,
            //color: Colors.black,
            size: 35.0,
          ),
          backgroundColor: Colors.grey[700],
        ),
    );
  }
}
