import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: const [
          Text(
            "BJW",
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          Text("bjw1403@gmail.com",
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ]),
      ],
    );
  }
}
