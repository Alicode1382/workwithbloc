import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapi/bloc/counter_bloc.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<Counterbloc, int>(
        builder: (context, state) {
          return Center(
            child: new Text(
              "counter you : ${state} ",
              style: new TextStyle(fontSize: 27, fontWeight: FontWeight.w800),
            ),
          );
        },
      ),
      floatingActionButton: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.bloc<Counterbloc>().add(Counter_event.incerement);
            },
            child: new Icon(Icons.add),
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              context.bloc<Counterbloc>().add(Counter_event.decrement);
            },
            child: new Icon(Icons.minimize),
          )
        ],
      ),
    );
  }
}
