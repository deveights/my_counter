import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_counter/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  Color getRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  double getRandomNumber() {
    final Random random = Random();
    return random.nextDouble() * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          sampleWidgetNoRebuild(context),
          sampleWidgetRebuildsAndItSucks(),
        ],
      ),
    );
  }

  Widget sampleWidgetRebuildsAndItSucks() {
    return Center(
      child: Consumer<CounterProvider>(
        builder: (_, value, _) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: getRandomColor(),
                width: getRandomNumber(),
                height: getRandomNumber(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => value.updateCounter(false),
                    icon: Icon(Icons.remove),
                  ),
                  Text('${value.counter}'),
                  IconButton(
                    onPressed: () => value.updateCounter(true),
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget sampleWidgetNoRebuild(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(color: getRandomColor(), width: 100, height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () =>
                    context.read<CounterProvider>().updateCounter(false),
                icon: Icon(Icons.remove),
              ),
              Selector<CounterProvider, int>(
                builder: (_, counter, _) => Text('$counter'),
                selector: (_, provider) => provider.counter,
              ),
              IconButton(
                onPressed: () =>
                    context.read<CounterProvider>()..updateCounter(true),
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
