import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parcial3/cart_cubit.dart';
import 'package:parcial3/home.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => CartCubit(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Ticket Booking',
      home: Home(),
    );
  }
}
