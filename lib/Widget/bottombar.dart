import 'package:flutter/material.dart';

class Bottombar extends StatelessWidget {
  const Bottombar({super.key, required this.changePage, required this.currentPage});

  final ValueChanged<int> changePage;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final isSelected = states.contains(WidgetState.selected);
        final baseStyle = Theme.of(context).textTheme.labelMedium ?? const TextStyle();

        return baseStyle.copyWith(
          overflow: TextOverflow.ellipsis,
          color: isSelected ? Color(0xFFF0F0F0) : Color(0xFF959595),
        );
      }),
      selectedIndex: currentPage,
      onDestinationSelected: changePage,
      destinations: [
        _barItem(Icons.home_sharp, "Home"),
        _barItem(Icons.library_books_sharp, "Library"),
        _barItem(Icons.search_sharp, "Search"),
      ],
    );
  }

  NavigationDestination _barItem(IconData icon, String label) {
    return NavigationDestination(icon: Icon(icon), label: label);
  }
}
