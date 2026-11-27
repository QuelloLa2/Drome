import 'package:flutter/material.dart';

class TopHome extends StatelessWidget {
  const TopHome({super.key});

  @override
  Widget build(BuildContext context) {
    String textDate = "";
    DateTime currentTime = DateTime.now();

    if (currentTime.hour >= 23 && currentTime.hour < 5) textDate = "Good Night";
    if (currentTime.hour >= 5 && currentTime.hour < 14) textDate = "Good Morning";
    if (currentTime.hour >= 14 && currentTime.hour < 17) textDate = "Good Afternoon";
    if (currentTime.hour >= 17) textDate = "Good Evening";

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(textDate, style: TextStyle(fontSize: 32)),
        Expanded(child: SizedBox()),
        IconButton(
          onPressed: () {
            print("Setting");
          },
          icon: Icon(Icons.settings_sharp),
        ),
      ],
    );
  }
}
