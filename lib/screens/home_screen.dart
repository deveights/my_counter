import 'package:flutter/material.dart';
import 'package:my_counter/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Counter')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [counterBuilder(context)],
      ),
    );
  }

  Widget counterBuilder(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => context.read<CounterProvider>().updateCounter(false),
          icon: Icon(Icons.remove),
        ),
        Selector<CounterProvider, int>(
          builder: (_, counter, _) => Text(
            'Counter: $counter',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          selector: (_, counter) => counter.counter,
        ),
        IconButton(
          onPressed: () => context.read<CounterProvider>().updateCounter(true),
          icon: Icon(Icons.add),
        ),
      ],
    );
  }
}
