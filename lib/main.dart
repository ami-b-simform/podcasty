import 'package:flutter/material.dart';

void main() {
  runApp(Podcasty());
}

class Podcasty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Podcasty'),
        ),
        body: Container(), // This container represents the blank screen
      ),
    );
  }
}
