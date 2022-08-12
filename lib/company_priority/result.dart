import 'dart:collection';

import 'package:flutter/material.dart';

import '../authentication/login.dart';
import '../authentication/mypage.dart';
import '../ui/topPage.dart';

class PriorityResultPage extends StatefulWidget {
  const PriorityResultPage(
      {Key? key, required this.companyList, required this.resultList})
      : super(key: key);

  final List<String> companyList;
  final List<int> resultList;

  @override
  State<PriorityResultPage> createState() => _PriorityResultPageState();
}

class _PriorityResultPageState extends State<PriorityResultPage> {
  final _pages = [LoginPage(), TopPage(), MyPage()];
  int _selectedIndex = 1;
  Map<String, int> companyMap = {};

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
    addMap(widget.companyList, widget.resultList, companyMap);
    // 降順にソート
    var scoreList = SplayTreeMap.from(
        companyMap, (a, b) => companyMap[b]!.compareTo(companyMap[a]!));
    var resultList = mapToList(scoreList);
    return Scaffold(
      appBar: AppBar(
        title: Text('企業の優先度'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Text('比較した結果')),
            Container(
              height: 60,
              child: ListView.builder(
                  itemCount: resultList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 20,
                      alignment: Alignment.center,
                      child: Text('${index + 1}\t\t\t' + resultList[index][0]),
                    );
                  }),
            ),
            ElevatedButton(onPressed: () {
              // 登録、保存
              Navigator.of(context).pushNamed('/home');
            }, child: Text('保存する')),
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

void addMap(List list1, List list2, Map<String, int> map) {
  // print(list1);
  // print(list2);
  for (int i = 0; i < list1.length; i++) {
    map.addAll({list1[i]: list2[i]});
  }
  // print(map);
}

List<List<String>> mapToList(Map map) {
  List<List<String>> list = [];
  map.forEach((key, value) {
    list.add([key, '$value']);
  });
  return list;
}
