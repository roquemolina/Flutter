import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/counter/counter_functions_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //constructor que trae el key de stateless widget
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.pink,
      ),
      home: const CounterFunctionsScreen(),
    );
  }
}
