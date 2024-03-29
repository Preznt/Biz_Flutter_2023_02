import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hello_003/etc_page.dart';
import 'package:hello_003/home_page.dart';
import 'package:hello_003/profile_page.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // 여기에서 선언된 변수는 return 문
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("나의 자랑"),
              bottom: const TabBar(tabs: [
                Tab(
                  text: "Home",
                ),
                Tab(
                  text: "프로필",
                ),
                Tab(
                  text: "기타",
                )
              ]),
            ),
            body: const TabBarView(
              children: [
                HomePage(),
                ProfilePage(),
                EtcPage(),
              ],
            ),
          )),
    );
  }
}
