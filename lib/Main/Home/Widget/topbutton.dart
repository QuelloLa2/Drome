import 'package:flutter/material.dart';

class TopButton extends StatelessWidget {
  const TopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        _button("Shuffle", Icons.shuffle_sharp, _shuffleMusic),
        _button("Favorite", Icons.favorite_sharp, _favoriteMusic),
      ],
    );
  }

  Expanded _button(String text, IconData data, VoidCallback function) {
    return Expanded(
      child: SizedBox(
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1))),
            elevation: 0,
          ),
          onPressed: function,
          child: Row(
            spacing: 7,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(data, size: 24),
              Text(text, style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }

  void _shuffleMusic() {}
  void _favoriteMusic() {}
}
