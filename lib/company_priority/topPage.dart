import 'package:flutter/material.dart';

import '../authentication/login.dart';
import '../authentication/mypage.dart';
import '../ui/topPage.dart';

class PriorityTopPage extends StatefulWidget {
  const PriorityTopPage({Key? key}) : super(key: key);

  @override
  State<PriorityTopPage> createState() => _PriorityTopPageState();
}

class _PriorityTopPageState extends State<PriorityTopPage> {
  final _pages = [LoginPage(), TopPage(), MyPage()];
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("企業の優先順位"),
      ),
      body: Center(
        child: Text("優先順位"),
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
      ),    );
  }
}
