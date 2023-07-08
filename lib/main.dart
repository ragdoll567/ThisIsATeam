import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

import 'Screens/Message.dart';
import 'Screens/MessageWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TIA - The Assistant',
      theme: ThemeData(brightness: Brightness.dark),
      home: Home(),
    );
  }
}
