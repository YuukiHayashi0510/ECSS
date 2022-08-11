import 'package:flutter/material.dart';

import '../authentication/login.dart';
import '../authentication/mypage.dart';
import '../ui/topPage.dart';

class PriorityComparisonPage extends StatefulWidget {
  const PriorityComparisonPage({Key? key, required this.companyList}) : super(key: key);

  final List<String> companyList;
  @override
  State<PriorityComparisonPage> createState() => _PriorityComparisonPageState();
}

class _PriorityComparisonPageState extends State<PriorityComparisonPage> {
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
        title: Text('企業の比較'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(widget.companyList[1])
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
