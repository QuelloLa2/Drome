import 'package:drome/Account/base.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Quantico'),
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
  @override
  Widget build(BuildContext context) {
    return BaseAccount();
  }
}
