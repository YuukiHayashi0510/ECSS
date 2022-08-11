import 'package:flutter/material.dart';
import 'package:support_company_selection/diagnose/company.dart';
import '../authentication/login.dart';
import '../authentication/mypage.dart';
import '../ui/topPage.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, required this.param}) : super(key: key);

  final double param;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final _pages = [LoginPage(), TopPage(), MyPage()];
  int _selectedIndex = 1;

  @override
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

  Widget build(BuildContext context) {
    String result = returnResult(widget.param);
    return Scaffold(
      appBar: AppBar(
        title: Text('診断結果'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 40),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Text(
                      '$result',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: returnColor(result),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ],
            ),
            Container(
              width: 200,
              height: 200,
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  returnResultText(result),
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DiagnoseCompanyPage(param: result))),
                child: Text('適正のある企業規模を見る'))
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

String returnResult(double num) {
  int resultNum = 0;
  String result = '';
  if (num - num.floor() > 0.5) {
    resultNum = num.ceil();
  } else
    resultNum = num.floor();
  switch (resultNum) {
    case 1:
      result = 'D';
      break;
    case 2:
      result = 'I';
      break;
    case 3:
      result = 'S';
      break;
    case 4:
      result = 'C';
      break;
  }
  return result;
}

Color returnColor(String result) {
  Color color = Colors.white;
  switch (result) {
    case 'D':
      color = Colors.green.shade100;
      break;
    case 'I':
      color = Colors.red.shade100;
      break;
    case 'S':
      color = Colors.blue.shade100;
      break;
    case 'C':
      color = Colors.yellow.shade100;
      break;
  }
  return color;
}

String returnResultText(String result) {
  String text = '';
  switch (result) {
    case 'D':
      text = '主導型\n直接的で決断が早い\n意志が強く、勝気でチャレンジ精神に富み、行動的で結果をすぐに求める傾向があります。';
      break;
    case 'I':
      text = '感化型\n楽観的で社交的\nいろいろなチームに加わり、アイディアを分かち合い、人々を励ましたり楽しませることを好みます。';
      break;
    case 'S':
      text =
          '安定型\n思いやりがあり、協力的\n人助けが好きで、表立つことなく働くことを好み、一貫性があり予測可能な範囲で行動し、聞き上手です。';
      break;
    case 'C':
      text =
          '慎重型\n緻密で正確\n仕事の質を高めることを重視して、計画性をもって系統だった手順で作業することを好み、間違いのないように何度も確認します。';
      break;
  }
  return text;
}
