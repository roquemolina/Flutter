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
    title:'Botontes',
    subTitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title:'Targetas',
    subTitle: 'Un contenedor estilizado',
    link: '/buttons',
    icon: Icons.credit_card,
  ),
];

