import 'package:flutter/widgets.dart';

class LogoText extends StatelessWidget {
  const LogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Drome", style: TextStyle(fontSize: 55, fontWeight: FontWeight.w700))],
      ),
    );
  }
}
