import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;
  //constructor
  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Counter',
    subTitle: 'Riverpod Counter',
    link: '/counter_screen',
    icon: Icons.add_circle_outline_outlined,
  ),
  MenuItem(
    title: 'Buttons',
    subTitle: 'Flutter buttons',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Cards',
    subTitle: 'Flutter cards',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Progress Indicators',
    subTitle: 'Generals and controlled',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'Snackbars',
    subTitle: 'Snackbars and dialogs',
    link: '/snackbars',
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: 'Animated Container',
    subTitle: 'Stateful wid Animated containers',
    link: '/animated',
    icon: Icons.check_box_outline_blank_outlined,
  ),
  MenuItem(
    title: 'UI Controls + Tiles',
    subTitle: 'Controls on Flutter',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined,
  ),
  MenuItem(
    title: 'Tutorial',
    subTitle: 'App Tutorial',
    link: '/tutorial',
    icon: Icons.info,
  ),
  MenuItem(
    title: 'Scroll and Refresh',
    subTitle: 'Infinite Scroll & Pull to refresh',
    link: '/infinite',
    icon: Icons.list_alt_outlined,
  ),
  MenuItem(
    title: 'Theme Changer',
    subTitle: 'On demand theme changer',
    link: '/theme_changer',
    icon: Icons.water_drop_outlined,
  ),
];
