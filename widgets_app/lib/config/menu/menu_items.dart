import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;
  //constructor
  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon
    });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title:'Buttons',
    subTitle: 'Flutter buttons',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title:'Cards',
    subTitle: 'Flutter cards',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title:'Progress Indicators',
    subTitle: 'Generals and controlled',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title:'Snackbars',
    subTitle: 'Snackbars and dialogs',
    link: '/snackbars',
    icon: Icons.info_outline,
  ),
  MenuItem(
    title:'Animated Container',
    subTitle: 'Stateful wid Animated containers',
    link: '/animated',
    icon: Icons.check_box_outline_blank_outlined,
  ),
];

