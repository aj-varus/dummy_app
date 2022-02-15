import 'package:flutter/material.dart';
//import 'ninja_id.dart';
import 'quotes_list.dart';

void main() {
  runApp(const MaterialApp(
    home: QuoteList()
  ));

}

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: const Text("My first flutter app")
        ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Text("Hi"),
            color: Colors.red,
          ),
          Container(
            //margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(20.0),
            child: const Text("Hi"),
            color: Colors.blue,
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Text("Hi"),
            color: Colors.green,
          )
        ]
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => "",
        child: const Icon(
          Icons.add,
          //color: Colors.black,
          size: 35.0,
        )
      ),
    );
  }
}

