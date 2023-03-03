import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hello Flutter"),
        ),
        body: bodyContainer());
  }

  Container bodyContainer() {
    return Container(
      width: 400,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.blue,
      )),
      child: Column(
        children: [
          bodyText(
            text: "안녕하세요",
            fontColor: Colors.blue,
            fontSize: 30,
          ),
          bodyText(
            text: "Repulic of Korea",
            fontColor: Colors.green,
            fontSize: 50,
          ),
          bodyText(text: "Korea"),
        ],
      ),
    );
  }

  // 중괄호를 빼면 위에서 바로 문자열로 보낼 수 있음
  // Color 는 선택적인데 값이 전달되지 않으면 블랙이 기본으로 설정됨
  Column bodyText({
    required String text,
    Color fontColor = Colors.black,
    double fontSize = 10,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(color: fontColor),
          fontSize: fontSize,
        ),
      ],
    );
  }
}
