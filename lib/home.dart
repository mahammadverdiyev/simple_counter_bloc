import 'package:counter_bloc_practice/counter_event.dart';
import 'package:counter_bloc_practice/counter_state.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'counter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("HOME BUILD");
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return new BlocListener<CounterBloc, CounterState>(
      listenWhen: (old, current) => current is LimitState,
      listener: (_, state) {
        if (state is LimitState) {
          Fluttertoast.showToast(
              msg: state.message,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              textColor: Colors.white,
              fontSize: 18.0);
        }
      },
      child: new Scaffold(
        body: new Center(
            child: BlocBuilder<CounterBloc, CounterState>(
                buildWhen: (oldState, currentState) =>
                    currentState is! LimitState,
                builder: (context, snapshot) {
                  return new Text("${snapshot.value}",
                      style: Theme.of(context).textTheme.headline2);
                })),
        floatingActionButton: new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            new FloatingActionButton(
              onPressed: () {
                counterBloc.add(new DecrementEvent());
              },
              tooltip: "Decrement",
              child: new Icon(Icons.remove),
            ),
            new SizedBox(
              width: 20,
            ),
            new FloatingActionButton(
              onPressed: () {
                counterBloc.add(new IncrementEvent());
              },
              tooltip: "Increment",
              child: new Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
