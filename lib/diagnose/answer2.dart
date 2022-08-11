import 'package:flutter/material.dart';

import 'answer3.dart';

//   ['断固とした', '楽観的', '緻密', '忍耐強い'],
//   ['意志が強い', '活気がある', '人前に出たがらない', '謙虚'],
//   ['強引', '活発', '系統的', 'そつがない'],
// ];

class DiagnoseAnswerPage2 extends StatefulWidget {
  const DiagnoseAnswerPage2({Key? key, required this.param}) : super(key: key);

  final double param;

  @override
  State<DiagnoseAnswerPage2> createState() => _DiagnoseAnswerPage2State();
}

class _DiagnoseAnswerPage2State extends State<DiagnoseAnswerPage2> {
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
                      title: Text('成果思考'),
                      value: 1.0,
                      groupValue: _gValue,
                      onChanged: (value) => _onRadioSelected(value),
                    ),
                    RadioListTile(
                      title: Text('熱意のある'),
                      value: 2.0,
                      groupValue: _gValue,
                      onChanged: (value) => _onRadioSelected(value),
                    ),
                    RadioListTile(
                      title: Text('感情を表に出さない'),
                      value: 3.0,
                      groupValue: _gValue,
                      onChanged: (value) => _onRadioSelected(value),
                    ),
                    RadioListTile(
                      title: Text('順応的'),
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
                              builder: (context) =>
                                  DiagnoseAnswerPage3(param: result)));
                    },
                    child: Text('次へ'))
            ],
          ),
        ),
      ),
    );
  }
}
