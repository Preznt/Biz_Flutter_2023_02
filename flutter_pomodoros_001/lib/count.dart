import 'package:flutter/material.dart';

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
            "pomodoro",
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
