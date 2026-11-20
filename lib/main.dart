import 'package:drome/Account/base.dart';
import 'package:drome/Home/base.dart';
import 'package:drome/Utils/checklogin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

enum AuthState { loading, auth, unauth }

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Quantico',
        colorSchemeSeed: Color(0xFF005A5A),
      ),
      home: const Drome(),
    );
  }
}

class Drome extends StatefulWidget {
  const Drome({super.key});

  @override
  State<Drome> createState() => _DromeState();
}

class _DromeState extends State<Drome> {
  AuthState _authState = AuthState.loading;

  @override
  void initState() {
    updateAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return switch (_authState) {
      AuthState.loading => const Scaffold(body: Center(child: CircularProgressIndicator())),
      AuthState.auth => BaseHome(),
      AuthState.unauth => BaseAccount(updateAuth: updateAuth),
    };
  }

  void updateAuth() async {
    AuthState value = await checkLogin();
    setState(() {
      _authState = value;
    });
  }
}
