import 'package:flutter/material.dart';
import 'package:support_company_selection/diagnose/answer2.dart';
import 'ui/topPage.dart';
import 'diagnose/topPage.dart';
import 'company_priority/topPage.dart';
import 'diagnose/answer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ECSS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new TopPage(),
      routes: <String, WidgetBuilder> {
        '/home':(BuildContext context) => new TopPage(),
        '/diagnose': (BuildContext context) => new DiagnoseTopPage(),
        '/diagnose/answer': (BuildContext context) => new DiagnoseAnswerPage(),
        '/priority': (BuildContext context) => new PriorityTopPage(),
      },
    );
  }
}




