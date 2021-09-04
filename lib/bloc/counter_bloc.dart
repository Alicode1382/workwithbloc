import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

enum Counter_event { incerement, decrement }

class Counterbloc extends Bloc<Counter_event, int> {
  Counterbloc() : super(0);

  @override
  Stream<int> mapEventToState(Counter_event event) async* {
    // TODO: implement mapEventToState
    if (event == Counter_event.incerement) {
      yield state + 1;
    } else if (event == Counter_event.decrement) {
      yield state - 1;
    }
  }
}
