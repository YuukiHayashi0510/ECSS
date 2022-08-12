import 'package:flutter/material.dart';
import 'package:support_company_selection/diagnose/answer2.dart';

import '../authentication/login.dart';
import '../authentication/mypage.dart';
import '../ui/topPage.dart';

// List<List> selectList = [
//   ['成果思考', '熱意のある', '感情を表に出さない', '順応的'],
//   ['断固とした', '楽観的', '緻密', '忍耐強い'],
//   ['意志が強い', '活気がある', '人前に出たがらない', '謙虚'],
//   ['強引', '活発', '系統的', 'そつがない'],
// ];

class DiagnoseAnswerPage extends StatefulWidget {
  const DiagnoseAnswerPage({Key? key}) : super(key: key);

  @override
  State<DiagnoseAnswerPage> createState() => _DiagnoseAnswerPageState();
}

class _DiagnoseAnswerPageState extends State<DiagnoseAnswerPage> {

  final _pages = [LoginPage(), TopPage(), const MyPage()];
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.of(context).push(MaterialPageRoute(
          settings: const RouteSettings(name: '/home'),
          builder: (context) {
            return _pages[_selectedIndex];
          }));
    });
  }

  double _gValue = 0;

  void _onRadioSelected(value) => setState(() {
        _gValue = value;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("特性診断"),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text('あなたに最も合うものを選んでください'),
                    RadioListTile(
                      title: Text('直接的'),
                      value: 1.0,
                      groupValue: _gValue,
                      onChanged: (value) => _onRadioSelected(value),
                    ),
                    RadioListTile(
                      title: Text('外交的'),
                      value: 2.0,
                      groupValue: _gValue,
                      onChanged: (value) => _onRadioSelected(value),
                    ),
                    RadioListTile(
                      title: Text('分析的'),
                      value: 3.0,
                      groupValue: _gValue,
                      onChanged: (value) => _onRadioSelected(value),
                    ),
                    RadioListTile(
                      title: Text('平成'),
                      value: 4.0,
                      groupValue: _gValue,
                      onChanged: (value) => _onRadioSelected(value),
                    ),
                  ],
                ),
              ),
              if (_gValue > 0)
                ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DiagnoseAnswerPage2(param: _gValue))),
                    child: Text('次へ'))
            ],
          ),
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
