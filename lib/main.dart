import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home()
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
      body: const Center(
        child: Text("Click on the button below") 
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => "",
        child: const Text("-"),
      ),
    );
  }
}

