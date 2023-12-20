import 'package:bloc_app/presentation/blocs/counter_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        // title: Text('cubit transactions ${ counterState.transactionCount }')
        title: context.select((CounterCubit value) {
          return Text('cubit transactions: ${value.state.transactionCount}');
        }),
        actions: [
          IconButton(
              onPressed: () {
                context.read<CounterCubit>().reset();
              },
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          // ya no es necesario ya que se utiliza equatable
          //buildWhen: (previous, current) => current.counter != previous.counter,
          builder: (context, state) {
            print('estado ha cambiado');
            return Text('Counter value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().increaseBy(1);
            },
            heroTag: '1',
            child: const Text('+1'),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().increaseBy(2);
            },
            heroTag: '2',
            child: const Text('+2'),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().increaseBy(5);
            },
            heroTag: '3',
            child: const Text('+5'),
          ),
        ],
      ),
    );
  }
}
