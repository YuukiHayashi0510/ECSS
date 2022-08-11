import 'package:flutter/material.dart';
import 'package:support_company_selection/company_priority/comparison_table.dart';
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

  final valueController1 = TextEditingController();
  final valueController2 = TextEditingController();
  final valueController3 = TextEditingController();

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("企業名登録画面"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                '希望している企業',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: size.width / 2,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: '第1希望'),
                    controller: valueController1,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: '第2希望'),
                    controller: valueController2,
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: '第3希望'),
                    controller: valueController3,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  onPressed: () {
                    List<String> companyList = [valueController1.text, valueController2.text, valueController3.text];
                    // firebaseに登録
                    // ページ遷移
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PriorityComparisonPage(companyList: companyList,)));
                  },
                  child: Text('登録')),
            )
            // Container(
            //   width: size.width / 10,
            //   child: DropdownButton(
            //       value: dropdownValue,
            //       style: TextStyle(fontSize: 10,color: Colors.black),
            //       items: companyKindList
            //           .map<DropdownMenuItem<String>>((String value) {
            //         return DropdownMenuItem<String>(
            //             value: value, child: Text(value));
            //       }).toList(),
            //       onChanged: (String? newValue) => setState(() {
            //             dropdownValue = newValue!;
            //           })),
            // )
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
