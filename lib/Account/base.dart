import 'package:drome/Account/Widget/confermbutton.dart';
import 'package:drome/Account/Widget/logotext.dart';
import 'package:drome/Account/Widget/textfield.dart';
import 'package:flutter/material.dart';

class BaseAccount extends StatefulWidget {
  const BaseAccount({super.key, required this.updateAuth});

  final Function updateAuth;

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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color(0xFF0E0E0E),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                spacing(3.9),

                LogoText(),
                spacing(32),

                TextInput(label: "Server Url", textController: _listEditorController[0]),
                spacing(30),

                TextInput(label: "Name", textController: _listEditorController[1]),
                spacing(30),

                TextInput(label: "Password", textController: _listEditorController[2]),
                spacing(30),

                ConfermButton(
                  label: "Conferm",
                  listEditorController: _listEditorController,
                  updateAuth: widget.updateAuth,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget spacing(double size) {
    return SizedBox(height: MediaQuery.of(context).size.height / size);
  }
}
