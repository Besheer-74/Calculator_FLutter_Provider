import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/logic.dart';
import 'view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorModel(),
      child: MaterialApp(
        title: 'Calculator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: CalculatorScreen(),
      ),
    );
  }
}
