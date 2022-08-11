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
