import 'package:bloc_app/presentation/blocs/counter_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const CounterBlocScreen(),
    );
  }
}

class CounterBlocScreen extends StatelessWidget {
  const CounterBlocScreen({
    super.key,
  });

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(CounterIncresed(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc bloc) =>
            Text('bloc counter ${bloc.state.transactionCount} :)')),
        actions: [
          IconButton(
              onPressed: () => context.read<CounterBloc>().add(CounterReset()),
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        child: context.select((CounterBloc bloc) {
          return Text('Counter value: ${bloc.state.counter}');
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context),
            heroTag: '1',
            child: const Text('+1'),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context, 2),
            heroTag: '2',
            child: const Text('+2'),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context, 3),
            heroTag: '3',
            child: const Text('+3'),
          ),
        ],
      ),
    );
  }
}
