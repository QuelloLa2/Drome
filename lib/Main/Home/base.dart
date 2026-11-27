import 'package:drome/Main/Home/Widget/recent.dart';
import 'package:drome/Main/Home/Widget/top.dart';
import 'package:drome/Main/Home/Widget/topbutton.dart';
import 'package:drome/Utils/spacing.dart';
import 'package:flutter/material.dart';

class BaseHome extends StatelessWidget {
  const BaseHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          dosomespace(16, context),
          TopHome(),
          dosomespace(45, context),
          TopButton(),
          dosomespace(27, context),
          RecentGrid(title: "Recently Added"),
          dosomespace(30, context),
        ],
      ),
    );
  }
}
