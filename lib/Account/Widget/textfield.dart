import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  const new({super.key, required this.label, required this._textController});

  final String label;
  final TextEditingController _textController;

  @override
  State<TextInput> createState() => TextInputState();
}

class TextInputState extends State<TextInput> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: widget._textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(1)),
          ),
          labelText: widget.label,
        ),
        obscureText: widget.label.compareTo("Password") == 0 ? true : false,
      ),
    );
  }

}
