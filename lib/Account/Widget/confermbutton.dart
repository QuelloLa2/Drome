import 'package:flutter/material.dart';
import 'package:drome/Utils/storage.dart' as auth;
import 'package:drome/Api/ping.dart' as ping;
import 'package:crypto/crypto.dart';

import 'dart:math';
import 'dart:convert';

class ConfermButton extends StatelessWidget {
  const ConfermButton({
    super.key,
    required this.label,
    required this._listEditorController,
    required this.updateAuth,
  });

  final String label;
  final List<TextEditingController> _listEditorController;
  final Function updateAuth;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pingServer,
      style: ElevatedButton.styleFrom(minimumSize: Size(130, 60)),
      child: Text(label, style: TextStyle(fontSize: 20)),
    );
  }

  void pingServer() async {
    if (_listEditorController[0].text.isEmpty ||
        _listEditorController[1].text.isEmpty ||
        _listEditorController[2].text.isEmpty) {
      return;
    }

    String salt = _generateSalt();
    String server = _listEditorController[0].text;
    String username = _listEditorController[1].text;
    String password = _generatePassword(_listEditorController[2].text, salt);

    final (data, success) = await ping.pingServer(server, username, password, salt);
    if (success && data == null) {
      auth.setServer(server);
      auth.setUsername(username);
      auth.setPassword(password);
      auth.setSalt(salt);
      updateAuth();
    }
  }

  String _generateSalt([int length = 6]) {
    final Random random = Random.secure();

    final List<int> values = List<int>.generate(length, (i) => random.nextInt(256));
    return base64Url.encode(values);
  }

  String _generatePassword(String password, String salt) {
    String input = '$password$salt';

    var bytes = utf8.encode(input);
    var hashPassword = md5.convert(bytes).toString();

    return hashPassword;
  }
}
