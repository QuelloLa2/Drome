import 'package:drome/Widget/appbar.dart';
import 'package:drome/Widget/bottombar.dart';
import 'package:flutter/material.dart';

class BaseHome extends StatefulWidget {
  const BaseHome({super.key});

  @override
  State<BaseHome> createState() => _BaseHomeState();
}

class _BaseHomeState extends State<BaseHome> {
  int currentPage = 0;

  final List<Widget> screens = [
    Center(child: Text('Home Screen')),
    Center(child: Text('Library Screen')),
    Center(child: Text('Search Screen')),
    Center(child: Text('Profile Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
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
