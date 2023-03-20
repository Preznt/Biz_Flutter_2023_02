import 'package:flutter/material.dart';

TextFormField inputBox({
  KeyboardType = TextInputType.text,
  String labelText = "값을 입력하세요",
  String errorMsg = "값을 입력하세요",
  Function(dynamic value)? onChanged,
  bool obscureText = false,
}) {
  return TextFormField(
    onChanged: onChanged,
    obscureText: obscureText,
    keyboardType: KeyboardType,
    // onSaved: (value) {},
    // validator 에서 return 한 메시지를 inputbox 하단에 보이기
    autovalidateMode: AutovalidateMode.always,
    validator: (value) {
      if (value!.isEmpty) {
        return errorMsg;
      }
      return null;
    },
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      labelText: labelText,
    ),
  );
}
