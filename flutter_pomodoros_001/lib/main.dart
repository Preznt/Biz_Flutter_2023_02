import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pomodoros_001/count.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "pomodoros",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DateTime _dateTime = DateTime(0, 0, 0, 0, 0);
  late int _second;
  late int _finalSecond =
      _dateTime.hour * 3600 + _dateTime.minute * 60 + _dateTime.second;
  int _counter = 0;
  bool _timerRun = false;
  late Timer _timer;

  // 시작버튼 클릭시 1초씩 카운트 다운 시작하는 메소드
  void _onPressed() {
    setState(() {
      _timerRun = !_timerRun;
    });
    if (_timerRun) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _finalSecond--;
        });

        if (_finalSecond < 1) {
          _counter++;
          _finalSecond = _second;
          _timerRun = !_timerRun;
          _timer.cancel();
        }
      });
    } else {
      _timer.cancel();
    }
  }

  // TimePickerSpinner 라이브러리
  Widget hourMinute24H() {
    return TimePickerSpinner(
      time: DateTime.utc(0, 0, 0, 0, 0, 0),
      is24HourMode: true,
      isShowSeconds: true,
      onTimeChange: (time) {
        setState(() {
          _second = time.hour * 3600 + time.minute * 60 + time.second;
        });
      },
    );
  }

  // TimePickerSpinner를 보여줄 모달창 생성
  Future<void> timeSetting(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('시간설정'),
          content: hourMinute24H(),
          actions: <Widget>[
            modalBtn(context, "취소", () {}),
            modalBtn(context, "확인", () {
              setState(() {
                _finalSecond = _second;
              });
            }),
          ],
        );
      },
    );
  }

// 모달 버튼 메소드
  TextButton modalBtn(
    BuildContext context,
    String title,
    Function? setTime,
  ) {
    return TextButton(
      style: TextButton.styleFrom(
        textStyle: Theme.of(context).textTheme.labelLarge,
      ),
      child: Text(title),
      onPressed: () {
        setTime!();
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 70),
          decoration: BoxDecoration(color: Colors.blue[200]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Duration(seconds: _finalSecond).toString().substring(0, 7),
                style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                btnIcon(
                  _onPressed,
                  _timerRun
                      ? const Icon(Icons.pause_circle_outline)
                      : const Icon(Icons.play_circle_outline),
                ),
                btnIcon(() {
                  setState(() {
                    _timer.cancel();
                    _timerRun = false;
                    _finalSecond = _second;
                  });
                }, const Icon(Icons.replay_outlined)),
                btnIcon(() {
                  timeSetting(context);
                }, const Icon(Icons.timer))
              ]),
              PomodorsCount(counter: _counter),
            ],
          ),
        ),
      ),
    );
  }

  IconButton btnIcon(void Function() btnActive, Icon icon) {
    return IconButton(
      iconSize: 100,
      onPressed: btnActive,
      color: Colors.white,
      icon: icon,
    );
  }
}
