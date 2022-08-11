import 'package:flutter/material.dart';
import 'package:support_company_selection/ui/component.dart';

class DiagnoseTopPage extends StatefulWidget {
  const DiagnoseTopPage({Key? key}) : super(key: key);

  @override
  State<DiagnoseTopPage> createState() => _DiagnoseTopPageState();
}

class _DiagnoseTopPageState extends State<DiagnoseTopPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("特性診断"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: size.height / 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: size.width / 2,
                    child: Image.asset('assets/images/disc_img.png')),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: size.height/20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: ()=>Navigator.of(context).pushNamed("/diagnose/answer"), child: Text("スタート")),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
