import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jaesyz Recipe App',
      home: Scaffold(
        appBar: AppBar(
          title:const Text('App Bar'),
        ),
        body:const Center(child: Text('Testing'),)
      ),
    );
  }
}
