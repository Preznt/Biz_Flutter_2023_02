import 'package:flutter/material.dart';

class CTextFormField extends StatelessWidget {
  const CTextFormField({
    super.key,
    required TextEditingController InputController,
    required this.labelText,
    required this.thisFocus,
    required this.nextFocus,
  }) : _InputController = InputController;

  final FocusNode thisFocus;
  final FocusNode nextFocus;

  final TextEditingController _InputController;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextFormField(
        controller: _InputController,
        decoration: InputDecoration(labelText: labelText),
        style: const TextStyle(fontSize: 15, color: Colors.blue),
        validator: (value) {
          if (value!.isEmpty) {
            return "$labelText 을 입력해 주세요";
          } else {
            return null;
          }
        },
        autovalidateMode: AutovalidateMode.always,
        textInputAction: TextInputAction.next,
        focusNode: thisFocus,
        autofocus: true,
        onFieldSubmitted: (value) async {
          _InputController.text = value;
          FocusScope.of(context).requestFocus(nextFocus);
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text(value)));
        },
      ),
    );
  }
}
