import 'package:flutter/material.dart';
import 'package:support_company_selection/diagnose/result.dart';
import '../authentication/login.dart';
import '../authentication/mypage.dart';
import '../ui/topPage.dart';

class DiagnoseCompanyPage extends StatefulWidget {
  const DiagnoseCompanyPage({Key? key, required this.param}) : super(key: key);

  final String param;

  @override
  State<DiagnoseCompanyPage> createState() => _DiagnoseCompanyPageState();
}

class _DiagnoseCompanyPageState extends State<DiagnoseCompanyPage> {
  final _pages = [LoginPage(), TopPage(), MyPage()];
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          settings: const RouteSettings(name: '/home'),
          builder: (context) {
            return _pages[_selectedIndex];
          }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('企業規模')),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Text(
                        '${widget.param}型のあなたに向いている企業は...',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: returnColor(widget.param),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          returnScaleText(widget.param),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          returnExplanationText(widget.param),
                          style: TextStyle(),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'MyPage'),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}

String returnScaleText(String param) {
  String result = '';
  switch (param) {
    case 'D':
      result = 'メガベンチャー';
      break;
    case 'I':
      result = 'ベンチャー・スタートアップ';
      break;
    case 'S':
      result = '大企業';
      break;
    case 'C':
      result = '中小企業';
      break;
  }
  return result;
}

String returnExplanationText(String param) {
  String text = '';
  switch (param) {
    case 'D':
      text = 'D型の人は、メガベンチャーの\n成果思考、チャレンジ精神と\nマッチしており、適性があります';
      break;
    case 'I':
      text = 'I型の人は、ベンチャー・スタートアップの和気藹々とした空気感とマッチしており、適性があります';
      break;
    case 'S':
      text = 'S型の人は、大企業の福利厚生、\n企業成長等、安定的な特性とマッチしており、\n適性があります';
      break;
    case 'C':
      text = 'C型の人は、中小企業の慎重さ、\n系統的な姿勢とマッチしており、\n適性があります';
      break;
  }
  return text;
}
