import 'package:flutter/material.dart';
import 'package:support_company_selection/diagnose/result.dart';

import '../authentication/login.dart';
import '../authentication/mypage.dart';
import '../ui/topPage.dart';

//   ['強引', '活発', '系統的', 'そつがない'],
// ];

class DiagnoseAnswerPage5 extends StatefulWidget {
  const DiagnoseAnswerPage5({Key? key, required this.param}) : super(key: key);

  final double param;

  @override
  State<DiagnoseAnswerPage5> createState() => _DiagnoseAnswerPage5State();
}

class _DiagnoseAnswerPage5State extends State<DiagnoseAnswerPage5> {
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
                      title: Text('強引'),
                      value: 1.0,
                      groupValue: _gValue,
                      onChanged: (value) => _onRadioSelected(value),
                    ),
                    RadioListTile(
                      title: Text('活発'),
                      value: 2.0,
                      groupValue: _gValue,
                      onChanged: (value) => _onRadioSelected(value),
                    ),
                    RadioListTile(
                      title: Text('系統的'),
                      value: 3.0,
                      groupValue: _gValue,
                      onChanged: (value) => _onRadioSelected(value),
                    ),
                    RadioListTile(
                      title: Text('そつがない'),
                      value: 4.0,
                      groupValue: _gValue,
                      onChanged: (value) => _onRadioSelected(value),
                    ),
                  ],
                ),
              ),
              if (_gValue > 0)
                ElevatedButton(
                    onPressed: () {
                      double result = 0;
                      result = (widget.param + _gValue) / 2;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultPage(param: result)));
                    },
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
