import 'package:flutter/material.dart';
import 'package:drome/Api/storage.dart';
import 'package:drome/Api/ping.dart' as ping;
import 'package:crypto/crypto.dart';

import 'dart:math';
import 'dart:convert';

class ConfermButton extends StatelessWidget {
  const new({super.key, required this.label, required this._listEditorController});

  final String label;
  final List<TextEditingController> _listEditorController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: pingServer, child: Text(label));
  }

  void pingServer() async {
    String salt = _generateSalt();
    String server = _listEditorController[0].text;
    String username = _listEditorController[1].text;
    String hashPassword = _generatePassword(_listEditorController[2].text, salt);

    final (data, success) = await ping.pingServer(server, username, hashPassword, salt);
    if (success && data == null) {
      storage.write(key: "Server", value: server);
      storage.write(key: "Username", value: username);
      storage.write(key: "Password", value: hashPassword);
      storage.write(key: "Salt", value: data);
    }

    print(data);
    print(success);
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
