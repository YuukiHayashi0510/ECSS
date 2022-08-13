import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'ui/topPage.dart';
import 'diagnose/topPage.dart';
import 'company_priority/topPage.dart';
import 'diagnose/answer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      debugShowCheckedModeBanner: false,
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




