import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  // 여기에 선언된 변수는 state
  // 여기에서 선언된 변수를 사용하여 화면에 값을 표현하는 곳이 있고
  // 여기 선언된 변수값을 어디선가 변경하고
  // setState()를 호출하면 화면이 다시 그려진다
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text("안녕하세요"),
        ],
      ),
    );
  }
}
