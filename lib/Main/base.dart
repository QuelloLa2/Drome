import 'package:drome/Main/Home/base.dart';
import 'package:drome/Widget/bottombar.dart';
import 'package:flutter/material.dart';

class BaseMain extends StatefulWidget {
  const BaseMain({super.key});

  @override
  State<BaseMain> createState() => _BaseMainState();
}

class _BaseMainState extends State<BaseMain> {
  int currentPage = 0;

  final List<Widget> screens = [
    BaseHome(),
    Center(child: Text('Playlist Screen')),
    Center(child: Text('Search Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentPage],
      bottomNavigationBar: Bottombar(changePage: _changePage, currentPage: currentPage),
    );
  }

  void _changePage(int indexPage) {
    setState(() {
      currentPage = indexPage;
    });
  }
}
