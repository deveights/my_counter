import 'package:flutter/material.dart';
import 'package:my_counter/providers/counter_provider.dart';
import 'package:my_counter/screens/counter_screen.dart';
// import 'package:my_counter/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider<CounterProvider>(create: (_) => CounterProvider()),
    ],
    child: MyCounter(),
  ),
);

class MyCounter extends StatelessWidget {
  const MyCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterScreen());
  }
}
