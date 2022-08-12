import 'package:flutter/material.dart';
import 'package:support_company_selection/company_priority/result.dart';

import '../authentication/login.dart';
import '../authentication/mypage.dart';
import '../ui/topPage.dart';

class PriorityComparisonPage extends StatefulWidget {
  const PriorityComparisonPage({Key? key, required this.companyList})
      : super(key: key);

  final List<String> companyList;

  @override
  State<PriorityComparisonPage> createState() => _PriorityComparisonPageState();
}

class _PriorityComparisonPageState extends State<PriorityComparisonPage> {
  final _pages = [LoginPage(), TopPage(), MyPage()];
  int _selectedIndex = 1;
  List<IconData> _iconList = [
    Icons.adjust,
    Icons.circle_outlined,
    Icons.question_mark,
    Icons.change_history,
    Icons.close
  ];
  List<int> _valueList = [2, 1, 0, -1, -2];
  List<String> _elementList = [
    '仕事内容',
    '理念への共感度',
    '親の共感度',
    '給料',
    '休日・勤務時間',
    '待遇',
    '勤務地',
    '入社後のイメージのしやすさ',
    '社内の雰囲気',
    '業界の将来性',
    '財務状況',
    '離職率'
  ];
  int? isSelectedItem = 0;
  int? isSelectedItem2 = 0;
  int? isSelectedItem3 = 0;
  int? isSelectedItem4 = 0;
  int? isSelectedItem5 = 0;
  int? isSelectedItem6 = 0;
  int? isSelectedItem7 = 0;
  int? isSelectedItem8 = 0;
  int? isSelectedItem9 = 0;
  int? isSelectedItem10 = 0;
  int? isSelectedItem11 = 0;
  int? isSelectedItem12 = 0;

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
        title: Text('企業の比較'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                '比較表',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('比較材料'),
                      )),
                  for (final company in widget.companyList)
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(company),
                        ))
                ]),
                TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('仕事内容'),
                      )),
                  TableCell(
                      child: Container(
                    alignment: Alignment.center,
                    child: DropdownButton(
                      items: [
                        for (int i = 0; i < _iconList.length; i++)
                          DropdownMenuItem(
                            child: Icon(_iconList[i]),
                            value: _valueList[i],
                          ),
                      ],
                      onChanged: (int? value) {
                        setState(() {
                          isSelectedItem = value;
                        });
                      },
                      value: isSelectedItem,
                    ),
                  )),
                  TableCell(
                      child: Container(
                    alignment: Alignment.center,
                    child: DropdownButton(
                      items: [
                        for (int i = 0; i < _iconList.length; i++)
                          DropdownMenuItem(
                            child: Icon(_iconList[i]),
                            value: _valueList[i],
                          ),
                      ],
                      onChanged: (int? value) {
                        setState(() {
                          isSelectedItem2 = value;
                        });
                      },
                      value: isSelectedItem2,
                    ),
                  )),
                  TableCell(
                      child: Container(
                    alignment: Alignment.center,
                    child: DropdownButton(
                      items: [
                        for (int i = 0; i < _iconList.length; i++)
                          DropdownMenuItem(
                            child: Icon(_iconList[i]),
                            value: _valueList[i],
                          ),
                      ],
                      onChanged: (int? value) {
                        setState(() {
                          isSelectedItem3 = value;
                        });
                      },
                      value: isSelectedItem3,
                    ),
                  )),
                ]),
                TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('理念への\n共感度'),
                      )),
                  TableCell(
                      child: Container(
                    alignment: Alignment.center,
                    child: DropdownButton(
                      items: [
                        for (int i = 0; i < _iconList.length; i++)
                          DropdownMenuItem(
                            child: Icon(_iconList[i]),
                            value: _valueList[i],
                          ),
                      ],
                      onChanged: (int? value) {
                        setState(() {
                          isSelectedItem4 = value;
                        });
                      },
                      value: isSelectedItem4,
                    ),
                  )),
                  TableCell(
                      child: Container(
                    alignment: Alignment.center,
                    child: DropdownButton(
                      items: [
                        for (int i = 0; i < _iconList.length; i++)
                          DropdownMenuItem(
                            child: Icon(_iconList[i]),
                            value: _valueList[i],
                          ),
                      ],
                      onChanged: (int? value) {
                        setState(() {
                          isSelectedItem5 = value;
                        });
                      },
                      value: isSelectedItem5,
                    ),
                  )),
                  TableCell(
                      child: Container(
                    alignment: Alignment.center,
                    child: DropdownButton(
                      items: [
                        for (int i = 0; i < _iconList.length; i++)
                          DropdownMenuItem(
                            child: Icon(_iconList[i]),
                            value: _valueList[i],
                          ),
                      ],
                      onChanged: (int? value) {
                        setState(() {
                          isSelectedItem6 = value;
                        });
                      },
                      value: isSelectedItem6,
                    ),
                  )),
                ]),
                TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('親の共感度'),
                      )),
                  TableCell(
                      child: Container(
                    alignment: Alignment.center,
                    child: DropdownButton(
                      items: [
                        for (int i = 0; i < _iconList.length; i++)
                          DropdownMenuItem(
                            child: Icon(_iconList[i]),
                            value: _valueList[i],
                          ),
                      ],
                      onChanged: (int? value) {
                        setState(() {
                          isSelectedItem7 = value;
                        });
                      },
                      value: isSelectedItem7,
                    ),
                  )),
                  TableCell(
                      child: Container(
                    alignment: Alignment.center,
                    child: DropdownButton(
                      items: [
                        for (int i = 0; i < _iconList.length; i++)
                          DropdownMenuItem(
                            child: Icon(_iconList[i]),
                            value: _valueList[i],
                          ),
                      ],
                      onChanged: (int? value) {
                        setState(() {
                          isSelectedItem8 = value;
                        });
                      },
                      value: isSelectedItem8,
                    ),
                  )),
                  TableCell(
                      child: Container(
                    alignment: Alignment.center,
                    child: DropdownButton(
                      items: [
                        for (int i = 0; i < _iconList.length; i++)
                          DropdownMenuItem(
                            child: Icon(_iconList[i]),
                            value: _valueList[i],
                          ),
                      ],
                      onChanged: (int? value) {
                        setState(() {
                          isSelectedItem9 = value;
                        });
                      },
                      value: isSelectedItem9,
                    ),
                  )),
                ]),
                TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('給料'),
                      )),
                  TableCell(
                      child: Container(
                    alignment: Alignment.center,
                    child: DropdownButton(
                      items: [
                        for (int i = 0; i < _iconList.length; i++)
                          DropdownMenuItem(
                            child: Icon(_iconList[i]),
                            value: _valueList[i],
                          ),
                      ],
                      onChanged: (int? value) {
                        setState(() {
                          isSelectedItem10 = value;
                        });
                      },
                      value: isSelectedItem10,
                    ),
                  )),
                  TableCell(
                      child: Container(
                    alignment: Alignment.center,
                    child: DropdownButton(
                      items: [
                        for (int i = 0; i < _iconList.length; i++)
                          DropdownMenuItem(
                            child: Icon(_iconList[i]),
                            value: _valueList[i],
                          ),
                      ],
                      onChanged: (int? value) {
                        setState(() {
                          isSelectedItem11 = value;
                        });
                      },
                      value: isSelectedItem11,
                    ),
                  )),
                  TableCell(
                      child: Container(
                    alignment: Alignment.center,
                    child: DropdownButton(
                      items: [
                        for (int i = 0; i < _iconList.length; i++)
                          DropdownMenuItem(
                            child: Icon(_iconList[i]),
                            value: _valueList[i],
                          ),
                      ],
                      onChanged: (int? value) {
                        setState(() {
                          isSelectedItem12 = value;
                        });
                      },
                      value: isSelectedItem12,
                    ),
                  )),
                ]),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  int sum = 0;
                  int sum2 = 0;
                  int sum3 = 0;
                  sum += isSelectedItem!;
                  sum2 += isSelectedItem2!;
                  sum3 += isSelectedItem3!;
                  sum += isSelectedItem4!;
                  sum2 += isSelectedItem5!;
                  sum3 += isSelectedItem6!;
                  sum += isSelectedItem7!;
                  sum2 += isSelectedItem8!;
                  sum3 += isSelectedItem9!;
                  sum += isSelectedItem10!;
                  sum2 += isSelectedItem11!;
                  sum3 += isSelectedItem12!;
                  var companyList = widget.companyList;
                  var resultList = [sum,sum2,sum3];
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PriorityResultPage(
                              companyList: companyList,
                              resultList: resultList)));
                },
                child: Text('優先度を見る'))
            // SizedBox(
            //   height: 20,
            // ),
            // Container(
            //   child: Expanded(
            //     child: ListView.builder(
            //         itemCount: widget.companyList.length,
            //         itemBuilder: (BuildContext context, int index) {
            //           return Container(
            //             height: size.height / 30,
            //             child: Center(
            //               child: Text(
            //                 widget.companyList[index],
            //                 style: TextStyle(fontSize: 16),
            //               ),
            //             ),
            //           );
            //         }),
            //   ),
            // ),
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
