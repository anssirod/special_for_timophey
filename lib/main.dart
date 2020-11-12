import 'package:counter_timophey/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

//TODO 1) загляни в [pubspec.yaml]
//TODO 2) загляни в [analysis_options.yaml]
//TODO 3) потом по всем файлам блока, в последовательности:  1)ивены 2)стейты 3)реализация блок
//TODO 4) ну и теперь в [main.dart]

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: Counter(),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //* чтобы не писать каждый раз эту огромную конструкцию при вызове ивентов,
    //* создадим переменную
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(state.counter.toString());
              },
            ),
            FlatButton(
                onPressed: () => _counterBloc.add(IncrementEvent()),
                child: const Text("encrement")),
            FlatButton(
                onPressed: () => _counterBloc.add(DecrementEvent()),
                child: const Text("decrement"))
          ],
        ),
      ),
    );
  }
}
