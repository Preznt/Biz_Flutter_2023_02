import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "pomodoros",
      theme: ThemeData(primarySwatch: Colors.amber),
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
  int _time = 60;
  int _counter = 0;
  bool _timerRun = false;
  late Timer _timer;

  void _onPressed() {
    setState(() {
      _timerRun = !_timerRun;
    });
    if (_timerRun) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _time--;
        });

        if (_time < 1) {
          _counter++;
          _time = 60;
          _timerRun = !_timerRun;
          _timer.cancel();
        }
      });
    } else {
      _timer.cancel();
    }
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
                Duration(seconds: _time, milliseconds: 0)
                    .toString()
                    .substring(2, 7),
                style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton(
                  iconSize: 130,
                  onPressed: _onPressed,
                  color: Colors.white,
                  icon: _timerRun
                      ? const Icon(Icons.pause_circle_outline)
                      : const Icon(Icons.play_circle_outline),
                ),
                IconButton(
                    iconSize: 110,
                    onPressed: () {
                      setState(() {
                        _timer.cancel();
                        _timerRun = false;
                        _time = 60;
                      });
                    },
                    color: Colors.white,
                    icon: const Icon(Icons.replay_outlined)),
              ]),
              PomodorsCount(counter: _counter),
            ],
          ),
        ),
      ),
    );
  }
}

class PomodorsCount extends StatelessWidget {
  const PomodorsCount({
    super.key,
    required int counter,
  }) : _counter = counter;

  final int _counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(35),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          color: Colors.white),
      child: Column(
        children: [
          const Text(
            "pomodors",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          Text(
            "$_counter",
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
