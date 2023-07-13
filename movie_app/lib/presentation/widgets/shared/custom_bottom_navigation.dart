import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie_filter_sharp),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
      ],
    );
  }
}
