import 'package:flutter/material.dart';

import '../comps/input_box.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    user,
    required void Function({
      required dynamic email,
      required dynamic password,
    })
        this.loginSubmit,
  });

  final Function loginSubmit;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _userEmail = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return loginForm();
  }

  Form loginForm() {
    return Form(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [
        const Image(
          width: 200,
          height: 200,
          image: AssetImage("images/user.png"),
        ),
        const SizedBox(
          height: 20,
        ),
        inputBox(
          KeyboardType: TextInputType.emailAddress,
          labelText: "이메일",
          errorMsg: "이메일을 입력해 주세요",
          onChanged: (value) {
            _userEmail = value;
            setState(() {});
          },
        ),
        const SizedBox(
          height: 10,
        ),
        inputBox(
          KeyboardType: TextInputType.text,
          labelText: "비밀번호",
          errorMsg: "비밀번호를 입력하세요",
          obscureText: true,
          onChanged: (value) {
            _password = value;
          },
        ),
        ElevatedButton(
          onPressed: () {
            widget.loginSubmit(
              email: _userEmail,
              password: _password,
            );
          },
          child: const Text("이메일 로그인하기"),
        ),
      ]),
    ));
  }
}
