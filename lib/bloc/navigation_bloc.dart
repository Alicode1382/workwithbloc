import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapi/Pages/Login_page.dart';
import 'package:moviesapi/Pages/Movies_Page.dart';

enum Navigation_event {
  Loginpage,
  Moviespage,
}

class Navigation_bloc extends Bloc<Navigation_event, Widget> {
  Navigation_bloc() : super(Loginpage());

  @override
  Stream<Widget> mapEventToState(Navigation_event event) async* {
    if (event == Navigation_event.Loginpage) {
      yield Loginpage();
    } else if (event == Navigation_event.Moviespage) {
      yield Moviespage();
    }
  }
}
