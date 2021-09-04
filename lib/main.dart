import 'package:flutter/material.dart';
import 'package:moviesapi/Pages/Login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapi/bloc/counter_bloc.dart';
import 'package:moviesapi/bloc/navigation_bloc.dart';
import 'package:moviesapi/counter/counter.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Movies Application",
      theme: ThemeData(
        fontFamily: 'Vazir',
        primaryColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        accentColor: Colors.redAccent,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 22.0, color: Colors.redAccent),
          headline2: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: Colors.redAccent,
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.blueAccent,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider<Counterbloc>(
        create: (context) => Counterbloc(),
        child: Counter(),
      ),
    );
  }
}
