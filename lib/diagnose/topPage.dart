import 'package:flutter/material.dart';
import '../authentication/login.dart';
import '../authentication/mypage.dart';
import '../ui/topPage.dart';

class DiagnoseTopPage extends StatefulWidget {
  const DiagnoseTopPage({Key? key}) : super(key: key);

  @override
  State<DiagnoseTopPage> createState() => _DiagnoseTopPageState();
}

class _DiagnoseTopPageState extends State<DiagnoseTopPage> {
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
