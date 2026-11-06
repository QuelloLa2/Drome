import 'package:drome/Account/Widget/confermbutton.dart';
import 'package:drome/Account/Widget/textfield.dart';
import 'package:flutter/material.dart';

class BaseAccount extends StatefulWidget {
  const new({super.key});

  @override
  State<BaseAccount> createState() => _BaseAccountState();
}

class _BaseAccountState extends State<BaseAccount> {
  late final List<TextEditingController> _listEditorController;

  @override
  void initState() {
    _listEditorController = List<TextEditingController>.generate(3, (i) => TextEditingController());
    super.initState();
  }

  @override
  void dispose() {
    for (var item in _listEditorController) {
      item.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 2.8),

              TextInput(label: "Server Url", textController: _listEditorController[0]),
              SizedBox(height: MediaQuery.of(context).size.height / 30),

              TextInput(label: "Name", textController: _listEditorController[1]),
              SizedBox(height: MediaQuery.of(context).size.height / 30),

              TextInput(label: "Password", textController: _listEditorController[2]),
              SizedBox(height: MediaQuery.of(context).size.height / 30),

              ConfermButton(label: "Conferm", listEditorController: _listEditorController),
            ],
          ),
        ),
      ),
    );
  }
}
